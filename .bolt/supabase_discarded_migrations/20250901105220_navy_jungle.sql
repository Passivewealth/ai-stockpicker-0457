/*
  # Enable Row Level Security and Create Policies

  1. Security Updates
    - Enable RLS on all tables
    - Create policies for authenticated users
    - Add user profile creation trigger
    - Set up proper access controls

  2. User Management
    - Automatic user profile creation on signup
    - User-specific data access policies
    - Secure portfolio data access

  3. Performance
    - Add indexes for better query performance
    - Optimize user-specific queries
*/

-- Enable RLS on all tables
ALTER TABLE user_profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE portfolios ENABLE ROW LEVEL SECURITY;
ALTER TABLE portfolio_constituents ENABLE ROW LEVEL SECURITY;
ALTER TABLE portfolio_snapshots ENABLE ROW LEVEL SECURITY;
ALTER TABLE user_preferences ENABLE ROW LEVEL SECURITY;

-- User Profiles Policies
CREATE POLICY "Users can read own profile"
  ON user_profiles
  FOR SELECT
  TO authenticated
  USING (auth.uid() = id);

CREATE POLICY "Users can update own profile"
  ON user_profiles
  FOR UPDATE
  TO authenticated
  USING (auth.uid() = id);

CREATE POLICY "Users can insert own profile"
  ON user_profiles
  FOR INSERT
  TO authenticated
  WITH CHECK (auth.uid() = id);

-- Portfolio Policies
CREATE POLICY "Users can read own portfolios"
  ON portfolios
  FOR SELECT
  TO authenticated
  USING (auth.uid() = user_id);

CREATE POLICY "Users can create own portfolios"
  ON portfolios
  FOR INSERT
  TO authenticated
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update own portfolios"
  ON portfolios
  FOR UPDATE
  TO authenticated
  USING (auth.uid() = user_id);

-- Portfolio Constituents Policies
CREATE POLICY "Users can read own portfolio constituents"
  ON portfolio_constituents
  FOR SELECT
  TO authenticated
  USING (auth.uid() = user_id OR user_id IS NULL);

CREATE POLICY "Public can read default portfolio constituents"
  ON portfolio_constituents
  FOR SELECT
  TO anon
  USING (user_id IS NULL);

CREATE POLICY "Users can manage own portfolio constituents"
  ON portfolio_constituents
  FOR ALL
  TO authenticated
  USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);

-- Portfolio Snapshots Policies
CREATE POLICY "Users can read own portfolio snapshots"
  ON portfolio_snapshots
  FOR SELECT
  TO authenticated
  USING (portfolio_id IN (
    SELECT id FROM portfolios WHERE user_id = auth.uid()
  ));

CREATE POLICY "Users can manage own portfolio snapshots"
  ON portfolio_snapshots
  FOR ALL
  TO authenticated
  USING (portfolio_id IN (
    SELECT id FROM portfolios WHERE user_id = auth.uid()
  ))
  WITH CHECK (portfolio_id IN (
    SELECT id FROM portfolios WHERE user_id = auth.uid()
  ));

-- User Preferences Policies
CREATE POLICY "Users can manage own preferences"
  ON user_preferences
  FOR ALL
  TO authenticated
  USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);

-- Function to handle new user registration
CREATE OR REPLACE FUNCTION handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO user_profiles (id, email, full_name, avatar_url)
  VALUES (
    NEW.id,
    NEW.email,
    NEW.raw_user_meta_data->>'full_name',
    NEW.raw_user_meta_data->>'avatar_url'
  );
  
  INSERT INTO user_preferences (user_id)
  VALUES (NEW.id);
  
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Trigger for automatic user profile creation
DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;
CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE FUNCTION handle_new_user();

-- Add performance indexes
CREATE INDEX IF NOT EXISTS idx_portfolio_constituents_user_quarter 
  ON portfolio_constituents(user_id, quarter);

CREATE INDEX IF NOT EXISTS idx_portfolio_constituents_quarter 
  ON portfolio_constituents(quarter) WHERE user_id IS NULL;

CREATE INDEX IF NOT EXISTS idx_user_profiles_email 
  ON user_profiles(email);

CREATE INDEX IF NOT EXISTS idx_portfolios_user_id 
  ON portfolios(user_id);