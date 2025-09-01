/*
  # Remove Authentication System

  1. Tables to Remove
    - `user_sessions` - User session management
    - `users` - User profiles and authentication data
  
  2. Security Changes
    - Disable RLS on `portfolio_holdings` table
    - Remove all authentication-based policies
    - Make portfolio data publicly accessible
  
  3. Schema Updates
    - Remove user_id foreign key from portfolio_holdings
    - Add sample data for public access
    - Clean up authentication-related functions
*/

-- Remove foreign key constraint from portfolio_holdings
DO $$
BEGIN
  IF EXISTS (
    SELECT 1 FROM information_schema.table_constraints 
    WHERE constraint_name = 'portfolio_holdings_user_id_fkey'
  ) THEN
    ALTER TABLE portfolio_holdings DROP CONSTRAINT portfolio_holdings_user_id_fkey;
  END IF;
END $$;

-- Remove user_id column from portfolio_holdings
DO $$
BEGIN
  IF EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'portfolio_holdings' AND column_name = 'user_id'
  ) THEN
    ALTER TABLE portfolio_holdings DROP COLUMN user_id;
  END IF;
END $$;

-- Disable RLS on portfolio_holdings
ALTER TABLE portfolio_holdings DISABLE ROW LEVEL SECURITY;

-- Drop all policies on portfolio_holdings
DO $$
DECLARE
    policy_record RECORD;
BEGIN
    FOR policy_record IN 
        SELECT policyname FROM pg_policies WHERE tablename = 'portfolio_holdings'
    LOOP
        EXECUTE 'DROP POLICY IF EXISTS ' || quote_ident(policy_record.policyname) || ' ON portfolio_holdings';
    END LOOP;
END $$;

-- Drop user_sessions table
DROP TABLE IF EXISTS user_sessions CASCADE;

-- Drop users table
DROP TABLE IF EXISTS users CASCADE;

-- Drop authentication-related functions
DROP FUNCTION IF EXISTS handle_new_user() CASCADE;
DROP FUNCTION IF EXISTS update_updated_at_column() CASCADE;
DROP FUNCTION IF EXISTS set_updated_at() CASCADE;

-- Add sample portfolio data for public access
INSERT INTO portfolio_holdings (stock_symbol, company_name, shares, purchase_price, current_price, quarter, year) VALUES
('RELIANCE', 'Reliance Industries Ltd.', 100, 2180.25, 2456.75, 'Q1', 2024),
('TCS', 'Tata Consultancy Services Ltd.', 50, 3200.50, 3542.30, 'Q1', 2024),
('HDFCBANK', 'HDFC Bank Ltd.', 75, 1520.40, 1634.85, 'Q1', 2024),
('INFY', 'Infosys Ltd.', 80, 1298.75, 1456.20, 'Q1', 2024),
('ICICIBANK', 'ICICI Bank Ltd.', 120, 978.60, 1089.45, 'Q1', 2024),
('BHARTIARTL', 'Bharti Airtel Ltd.', 60, 1089.30, 1234.50, 'Q2', 2024),
('TITAN', 'Titan Company Ltd.', 40, 2876.40, 3234.50, 'Q2', 2024),
('NESTLEIND', 'Nestle India Ltd.', 10, 21234.60, 23456.75, 'Q2', 2024),
('MARUTI', 'Maruti Suzuki India Ltd.', 15, 9234.80, 10456.25, 'Q2', 2024),
('HCLTECH', 'HCL Technologies Ltd.', 90, 1098.50, 1234.75, 'Q3', 2024)
ON CONFLICT DO NOTHING;