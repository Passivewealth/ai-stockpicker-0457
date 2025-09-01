/*
  # Authentication and Portfolio Database Schema

  1. New Tables
    - `users` - Custom user profiles with email/password authentication
    - `user_sessions` - Session management for authenticated users
    - `portfolio_holdings` - User portfolio data with stock holdings

  2. Security
    - Enable RLS on all tables
    - Add policies for authenticated users to access only their own data
    - Secure session management

  3. Sample Data
    - Populate portfolio_holdings with realistic dummy data
    - Cover 8 historical quarters with diverse stock holdings
    - Include various sectors and performance metrics
*/

-- Create users table
CREATE TABLE IF NOT EXISTS users (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  email text UNIQUE NOT NULL,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

-- Create user_sessions table
CREATE TABLE IF NOT EXISTS user_sessions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid REFERENCES users(id) ON DELETE CASCADE,
  session_token text UNIQUE NOT NULL,
  expires_at timestamptz NOT NULL,
  created_at timestamptz DEFAULT now()
);

-- Create portfolio_holdings table
CREATE TABLE IF NOT EXISTS portfolio_holdings (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid REFERENCES users(id) ON DELETE CASCADE,
  stock_symbol text NOT NULL,
  company_name text NOT NULL,
  shares integer NOT NULL CHECK (shares > 0),
  purchase_price decimal(10,2) NOT NULL CHECK (purchase_price > 0),
  current_price decimal(10,2) NOT NULL CHECK (current_price > 0),
  quarter text NOT NULL,
  year integer NOT NULL CHECK (year >= 2020),
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

-- Enable RLS
ALTER TABLE users ENABLE ROW LEVEL SECURITY;
ALTER TABLE user_sessions ENABLE ROW LEVEL SECURITY;
ALTER TABLE portfolio_holdings ENABLE ROW LEVEL SECURITY;

-- RLS Policies for users table
CREATE POLICY "Users can read own profile"
  ON users
  FOR SELECT
  TO authenticated
  USING (auth.uid() = id);

CREATE POLICY "Users can update own profile"
  ON users
  FOR UPDATE
  TO authenticated
  USING (auth.uid() = id);

-- RLS Policies for user_sessions table
CREATE POLICY "Users can read own sessions"
  ON user_sessions
  FOR SELECT
  TO authenticated
  USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own sessions"
  ON user_sessions
  FOR INSERT
  TO authenticated
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can delete own sessions"
  ON user_sessions
  FOR DELETE
  TO authenticated
  USING (auth.uid() = user_id);

-- RLS Policies for portfolio_holdings table
CREATE POLICY "Users can read own portfolio"
  ON portfolio_holdings
  FOR SELECT
  TO authenticated
  USING (auth.uid() = user_id);

CREATE POLICY "Users can insert own portfolio"
  ON portfolio_holdings
  FOR INSERT
  TO authenticated
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update own portfolio"
  ON portfolio_holdings
  FOR UPDATE
  TO authenticated
  USING (auth.uid() = user_id);

CREATE POLICY "Users can delete own portfolio"
  ON portfolio_holdings
  FOR DELETE
  TO authenticated
  USING (auth.uid() = user_id);

-- Create indexes for performance
CREATE INDEX IF NOT EXISTS idx_portfolio_user_quarter ON portfolio_holdings(user_id, quarter, year);
CREATE INDEX IF NOT EXISTS idx_portfolio_symbol ON portfolio_holdings(stock_symbol);
CREATE INDEX IF NOT EXISTS idx_sessions_user ON user_sessions(user_id);
CREATE INDEX IF NOT EXISTS idx_sessions_token ON user_sessions(session_token);

-- Create updated_at trigger function
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$ language 'plpgsql';

-- Add triggers for updated_at
CREATE TRIGGER update_users_updated_at
  BEFORE UPDATE ON users
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_portfolio_updated_at
  BEFORE UPDATE ON portfolio_holdings
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

-- Function to create sample portfolio data for a user
CREATE OR REPLACE FUNCTION create_sample_portfolio_data(target_user_id uuid)
RETURNS void AS $$
DECLARE
  quarters text[] := ARRAY['Q1', 'Q2', 'Q3', 'Q4'];
  years integer[] := ARRAY[2023, 2024];
  stocks record;
BEGIN
  -- Sample stock data with realistic Indian market stocks
  FOR stocks IN 
    SELECT * FROM (VALUES
      ('TCS', 'Tata Consultancy Services Ltd.', 50, 3200.00, 3542.30),
      ('RELIANCE', 'Reliance Industries Ltd.', 75, 2180.25, 2456.75),
      ('HDFCBANK', 'HDFC Bank Ltd.', 100, 1520.40, 1634.85),
      ('INFY', 'Infosys Ltd.', 80, 1298.75, 1456.20),
      ('ICICIBANK', 'ICICI Bank Ltd.', 120, 978.60, 1089.45),
      ('BHARTIARTL', 'Bharti Airtel Ltd.', 90, 1089.30, 1234.50),
      ('TITAN', 'Titan Company Ltd.', 60, 2876.40, 3234.50),
      ('NESTLEIND', 'Nestle India Ltd.', 25, 21234.60, 23456.75),
      ('MARUTI', 'Maruti Suzuki India Ltd.', 40, 9234.80, 10456.25),
      ('HCLTECH', 'HCL Technologies Ltd.', 70, 1098.50, 1234.75),
      ('HINDUNILVR', 'Hindustan Unilever Ltd.', 45, 2156.30, 2387.60),
      ('ASIANPAINT', 'Asian Paints Ltd.', 35, 2876.90, 3156.80)
    ) AS t(symbol, name, shares, purchase, current)
  LOOP
    -- Insert data for each quarter and year combination
    FOR i IN 1..array_length(years, 1) LOOP
      FOR j IN 1..array_length(quarters, 1) LOOP
        -- Add some randomness to prices and shares
        INSERT INTO portfolio_holdings (
          user_id,
          stock_symbol,
          company_name,
          shares,
          purchase_price,
          current_price,
          quarter,
          year,
          created_at
        ) VALUES (
          target_user_id,
          stocks.symbol,
          stocks.name,
          stocks.shares + (random() * 20 - 10)::integer, -- Random variation in shares
          stocks.purchase + (random() * 100 - 50), -- Random variation in purchase price
          stocks.current + (random() * 200 - 100), -- Random variation in current price
          quarters[j],
          years[i],
          now() - (random() * interval '365 days') -- Random creation date within last year
        );
      END LOOP;
    END LOOP;
  END LOOP;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Function to get portfolio summary
CREATE OR REPLACE FUNCTION get_portfolio_summary(target_user_id uuid)
RETURNS TABLE(
  total_value decimal,
  total_cost decimal,
  total_gain_loss decimal,
  total_gain_loss_percent decimal,
  total_shares bigint
) AS $$
BEGIN
  RETURN QUERY
  SELECT 
    SUM(shares * current_price) as total_value,
    SUM(shares * purchase_price) as total_cost,
    SUM(shares * current_price) - SUM(shares * purchase_price) as total_gain_loss,
    CASE 
      WHEN SUM(shares * purchase_price) > 0 
      THEN ((SUM(shares * current_price) - SUM(shares * purchase_price)) / SUM(shares * purchase_price)) * 100
      ELSE 0
    END as total_gain_loss_percent,
    SUM(shares) as total_shares
  FROM portfolio_holdings
  WHERE user_id = target_user_id;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;