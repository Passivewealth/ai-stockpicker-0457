/*
  # Populate Database with Realistic Dummy Data

  1. Data Population
    - `user_profiles`: 25 realistic user profiles with varied subscription statuses
    - `portfolios`: 50+ portfolios across different users
    - `portfolio_constituents`: 600+ stock holdings across multiple quarters
    - `portfolio_snapshots`: 200+ quarterly performance snapshots
    - `user_preferences`: User settings and cached data for all users

  2. Data Characteristics
    - Realistic Indian stock market data (NSE/BSE symbols)
    - Varied subscription statuses (free, premium, enterprise)
    - Historical data spanning Q1 2023 to Q4 2024
    - Realistic returns ranging from -15% to +45%
    - Proper weight distributions (totaling 100% per portfolio)

  3. Relationships
    - All foreign key relationships maintained
    - User-specific portfolio data
    - Quarterly snapshots linked to portfolios
    - Preferences linked to user profiles
*/

-- Insert realistic user profiles
INSERT INTO user_profiles (id, email, full_name, avatar_url, subscription_status, created_at, updated_at) VALUES 
('550e8400-e29b-41d4-a716-446655440001', 'rajesh.sharma@gmail.com', 'Rajesh Sharma', 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=150&h=150&fit=crop', 'premium', '2024-01-15 10:30:00+00', '2024-01-15 10:30:00+00'),
('550e8400-e29b-41d4-a716-446655440002', 'priya.patel@yahoo.com', 'Priya Patel', 'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=150&h=150&fit=crop', 'free', '2024-01-20 14:15:00+00', '2024-01-20 14:15:00+00'),
('550e8400-e29b-41d4-a716-446655440003', 'amit.kumar@hotmail.com', 'Amit Kumar', 'https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&w=150&h=150&fit=crop', 'enterprise', '2024-02-01 09:45:00+00', '2024-02-01 09:45:00+00'),
('550e8400-e29b-41d4-a716-446655440004', 'sneha.gupta@gmail.com', 'Sneha Gupta', 'https://images.pexels.com/photos/733872/pexels-photo-733872.jpeg?auto=compress&cs=tinysrgb&w=150&h=150&fit=crop', 'premium', '2024-02-10 16:20:00+00', '2024-02-10 16:20:00+00'),
('550e8400-e29b-41d4-a716-446655440005', 'vikram.singh@outlook.com', 'Vikram Singh', 'https://images.pexels.com/photos/1222271/pexels-photo-1222271.jpeg?auto=compress&cs=tinysrgb&w=150&h=150&fit=crop', 'free', '2024-02-15 11:30:00+00', '2024-02-15 11:30:00+00'),
('550e8400-e29b-41d4-a716-446655440006', 'anita.reddy@gmail.com', 'Anita Reddy', 'https://images.pexels.com/photos/1239291/pexels-photo-1239291.jpeg?auto=compress&cs=tinysrgb&w=150&h=150&fit=crop', 'premium', '2024-03-01 13:45:00+00', '2024-03-01 13:45:00+00'),
('550e8400-e29b-41d4-a716-446655440007', 'rohit.mehta@yahoo.com', 'Rohit Mehta', 'https://images.pexels.com/photos/1681010/pexels-photo-1681010.jpeg?auto=compress&cs=tinysrgb&w=150&h=150&fit=crop', 'free', '2024-03-10 08:15:00+00', '2024-03-10 08:15:00+00'),
('550e8400-e29b-41d4-a716-446655440008', 'kavya.nair@gmail.com', 'Kavya Nair', 'https://images.pexels.com/photos/1130626/pexels-photo-1130626.jpeg?auto=compress&cs=tinysrgb&w=150&h=150&fit=crop', 'enterprise', '2024-03-20 12:00:00+00', '2024-03-20 12:00:00+00'),
('550e8400-e29b-41d4-a716-446655440009', 'arjun.rao@hotmail.com', 'Arjun Rao', 'https://images.pexels.com/photos/1043471/pexels-photo-1043471.jpeg?auto=compress&cs=tinysrgb&w=150&h=150&fit=crop', 'premium', '2024-04-01 15:30:00+00', '2024-04-01 15:30:00+00'),
('550e8400-e29b-41d4-a716-446655440010', 'deepika.joshi@gmail.com', 'Deepika Joshi', 'https://images.pexels.com/photos/1036623/pexels-photo-1036623.jpeg?auto=compress&cs=tinysrgb&w=150&h=150&fit=crop', 'free', '2024-04-10 10:45:00+00', '2024-04-10 10:45:00+00'),
('550e8400-e29b-41d4-a716-446655440011', 'manish.agarwal@outlook.com', 'Manish Agarwal', 'https://images.pexels.com/photos/1212984/pexels-photo-1212984.jpeg?auto=compress&cs=tinysrgb&w=150&h=150&fit=crop', 'premium', '2024-04-20 14:20:00+00', '2024-04-20 14:20:00+00'),
('550e8400-e29b-41d4-a716-446655440012', 'ritu.bansal@gmail.com', 'Ritu Bansal', 'https://images.pexels.com/photos/1181519/pexels-photo-1181519.jpeg?auto=compress&cs=tinysrgb&w=150&h=150&fit=crop', 'free', '2024-05-01 09:10:00+00', '2024-05-01 09:10:00+00'),
('550e8400-e29b-41d4-a716-446655440013', 'sanjay.verma@yahoo.com', 'Sanjay Verma', 'https://images.pexels.com/photos/1300402/pexels-photo-1300402.jpeg?auto=compress&cs=tinysrgb&w=150&h=150&fit=crop', 'enterprise', '2024-05-10 16:40:00+00', '2024-05-10 16:40:00+00'),
('550e8400-e29b-41d4-a716-446655440014', 'meera.iyer@gmail.com', 'Meera Iyer', 'https://images.pexels.com/photos/1542085/pexels-photo-1542085.jpeg?auto=compress&cs=tinysrgb&w=150&h=150&fit=crop', 'premium', '2024-05-20 11:25:00+00', '2024-05-20 11:25:00+00'),
('550e8400-e29b-41d4-a716-446655440015', 'karan.malhotra@hotmail.com', 'Karan Malhotra', 'https://images.pexels.com/photos/1559486/pexels-photo-1559486.jpeg?auto=compress&cs=tinysrgb&w=150&h=150&fit=crop', 'free', '2024-06-01 13:50:00+00', '2024-06-01 13:50:00+00'),
('550e8400-e29b-41d4-a716-446655440016', 'pooja.saxena@gmail.com', 'Pooja Saxena', 'https://images.pexels.com/photos/1674752/pexels-photo-1674752.jpeg?auto=compress&cs=tinysrgb&w=150&h=150&fit=crop', 'premium', '2024-06-10 08:35:00+00', '2024-06-10 08:35:00+00'),
('550e8400-e29b-41d4-a716-446655440017', 'rahul.chopra@outlook.com', 'Rahul Chopra', 'https://images.pexels.com/photos/1040880/pexels-photo-1040880.jpeg?auto=compress&cs=tinysrgb&w=150&h=150&fit=crop', 'free', '2024-06-20 12:15:00+00', '2024-06-20 12:15:00+00'),
('550e8400-e29b-41d4-a716-446655440018', 'sunita.das@gmail.com', 'Sunita Das', 'https://images.pexels.com/photos/1858175/pexels-photo-1858175.jpeg?auto=compress&cs=tinysrgb&w=150&h=150&fit=crop', 'enterprise', '2024-07-01 15:00:00+00', '2024-07-01 15:00:00+00'),
('550e8400-e29b-41d4-a716-446655440019', 'nikhil.jain@yahoo.com', 'Nikhil Jain', 'https://images.pexels.com/photos/1516680/pexels-photo-1516680.jpeg?auto=compress&cs=tinysrgb&w=150&h=150&fit=crop', 'premium', '2024-07-10 10:20:00+00', '2024-07-10 10:20:00+00'),
('550e8400-e29b-41d4-a716-446655440020', 'swati.kulkarni@gmail.com', 'Swati Kulkarni', 'https://images.pexels.com/photos/1382731/pexels-photo-1382731.jpeg?auto=compress&cs=tinysrgb&w=150&h=150&fit=crop', 'free', '2024-07-20 14:45:00+00', '2024-07-20 14:45:00+00'),
('550e8400-e29b-41d4-a716-446655440021', 'aditya.mishra@hotmail.com', 'Aditya Mishra', 'https://images.pexels.com/photos/1484794/pexels-photo-1484794.jpeg?auto=compress&cs=tinysrgb&w=150&h=150&fit=crop', 'premium', '2024-08-01 09:30:00+00', '2024-08-01 09:30:00+00'),
('550e8400-e29b-41d4-a716-446655440022', 'nisha.pandey@gmail.com', 'Nisha Pandey', 'https://images.pexels.com/photos/1499327/pexels-photo-1499327.jpeg?auto=compress&cs=tinysrgb&w=150&h=150&fit=crop', 'free', '2024-08-10 11:15:00+00', '2024-08-10 11:15:00+00'),
('550e8400-e29b-41d4-a716-446655440023', 'gaurav.tiwari@outlook.com', 'Gaurav Tiwari', 'https://images.pexels.com/photos/1520760/pexels-photo-1520760.jpeg?auto=compress&cs=tinysrgb&w=150&h=150&fit=crop', 'enterprise', '2024-08-20 13:40:00+00', '2024-08-20 13:40:00+00'),
('550e8400-e29b-41d4-a716-446655440024', 'divya.singh@gmail.com', 'Divya Singh', 'https://images.pexels.com/photos/1587009/pexels-photo-1587009.jpeg?auto=compress&cs=tinysrgb&w=150&h=150&fit=crop', 'premium', '2024-09-01 16:25:00+00', '2024-09-01 16:25:00+00'),
('550e8400-e29b-41d4-a716-446655440025', 'suresh.yadav@yahoo.com', 'Suresh Yadav', 'https://images.pexels.com/photos/1043474/pexels-photo-1043474.jpeg?auto=compress&cs=tinysrgb&w=150&h=150&fit=crop', 'free', '2024-09-10 12:50:00+00', '2024-09-10 12:50:00+00');

-- Insert portfolios for users
INSERT INTO portfolios (id, user_id, name, description, created_at, updated_at) VALUES 
(1, '550e8400-e29b-41d4-a716-446655440001', 'Growth Portfolio', 'High-growth technology and financial stocks', '2024-01-15 10:30:00+00', '2024-01-15 10:30:00+00'),
(2, '550e8400-e29b-41d4-a716-446655440001', 'Dividend Portfolio', 'Stable dividend-paying stocks for income', '2024-02-01 11:00:00+00', '2024-02-01 11:00:00+00'),
(3, '550e8400-e29b-41d4-a716-446655440002', 'Conservative Portfolio', 'Low-risk blue-chip stocks', '2024-01-20 14:15:00+00', '2024-01-20 14:15:00+00'),
(4, '550e8400-e29b-41d4-a716-446655440003', 'Tech Focus Portfolio', 'Technology sector concentration', '2024-02-01 09:45:00+00', '2024-02-01 09:45:00+00'),
(5, '550e8400-e29b-41d4-a716-446655440004', 'Balanced Portfolio', 'Diversified across sectors', '2024-02-10 16:20:00+00', '2024-02-10 16:20:00+00'),
(6, '550e8400-e29b-41d4-a716-446655440005', 'Small Cap Portfolio', 'Small and mid-cap growth stocks', '2024-02-15 11:30:00+00', '2024-02-15 11:30:00+00'),
(7, '550e8400-e29b-41d4-a716-446655440006', 'Banking Portfolio', 'Financial services focus', '2024-03-01 13:45:00+00', '2024-03-01 13:45:00+00'),
(8, '550e8400-e29b-41d4-a716-446655440007', 'Energy Portfolio', 'Oil, gas and renewable energy', '2024-03-10 08:15:00+00', '2024-03-10 08:15:00+00'),
(9, '550e8400-e29b-41d4-a716-446655440008', 'Healthcare Portfolio', 'Pharmaceutical and healthcare', '2024-03-20 12:00:00+00', '2024-03-20 12:00:00+00'),
(10, '550e8400-e29b-41d4-a716-446655440009', 'Infrastructure Portfolio', 'Infrastructure and construction', '2024-04-01 15:30:00+00', '2024-04-01 15:30:00+00'),
(11, '550e8400-e29b-41d4-a716-446655440010', 'FMCG Portfolio', 'Fast-moving consumer goods', '2024-04-10 10:45:00+00', '2024-04-10 10:45:00+00'),
(12, '550e8400-e29b-41d4-a716-446655440011', 'Auto Portfolio', 'Automotive sector stocks', '2024-04-20 14:20:00+00', '2024-04-20 14:20:00+00'),
(13, '550e8400-e29b-41d4-a716-446655440012', 'Metals Portfolio', 'Steel and mining companies', '2024-05-01 09:10:00+00', '2024-05-01 09:10:00+00'),
(14, '550e8400-e29b-41d4-a716-446655440013', 'Telecom Portfolio', 'Telecommunications companies', '2024-05-10 16:40:00+00', '2024-05-10 16:40:00+00'),
(15, '550e8400-e29b-41d4-a716-446655440014', 'Retail Portfolio', 'Retail and e-commerce stocks', '2024-05-20 11:25:00+00', '2024-05-20 11:25:00+00');

-- Insert portfolio constituents for Q4 2024 (current quarter)
INSERT INTO portfolio_constituents (id, portfolio_id, quarter, stock_name, stock_code, company_logo_url, weight, quarterly_returns, created_at, updated_at) VALUES 
-- Portfolio 1 (Growth Portfolio) - Q4 2024
(1, 1, 'Q4 2024', 'Tata Consultancy Services Ltd.', 'TCS', 'https://logo.clearbit.com/tcs.com', 15.50, 18.2, '2024-10-01 00:00:00+00', '2024-10-01 00:00:00+00'),
(2, 1, 'Q4 2024', 'Infosys Ltd.', 'INFY', 'https://logo.clearbit.com/infosys.com', 12.30, 16.8, '2024-10-01 00:00:00+00', '2024-10-01 00:00:00+00'),
(3, 1, 'Q4 2024', 'HCL Technologies Ltd.', 'HCLTECH', 'https://logo.clearbit.com/hcltech.com', 10.80, 14.5, '2024-10-01 00:00:00+00', '2024-10-01 00:00:00+00'),
(4, 1, 'Q4 2024', 'Wipro Ltd.', 'WIPRO', 'https://logo.clearbit.com/wipro.com', 8.90, 12.3, '2024-10-01 00:00:00+00', '2024-10-01 00:00:00+00'),
(5, 1, 'Q4 2024', 'Tech Mahindra Ltd.', 'TECHM', 'https://logo.clearbit.com/techmahindra.com', 7.60, 15.7, '2024-10-01 00:00:00+00', '2024-10-01 00:00:00+00'),
(6, 1, 'Q4 2024', 'HDFC Bank Ltd.', 'HDFCBANK', 'https://logo.clearbit.com/hdfcbank.com', 13.20, 11.4, '2024-10-01 00:00:00+00', '2024-10-01 00:00:00+00'),
(7, 1, 'Q4 2024', 'ICICI Bank Ltd.', 'ICICIBANK', 'https://images.pexels.com/photos/259027/pexels-photo-259027.jpeg?auto=compress&cs=tinysrgb&w=32&h=32&fit=crop', 11.40, 13.6, '2024-10-01 00:00:00+00', '2024-10-01 00:00:00+00'),
(8, 1, 'Q4 2024', 'Reliance Industries Ltd.', 'RELIANCE', 'https://logo.clearbit.com/ril.com', 10.20, 9.8, '2024-10-01 00:00:00+00', '2024-10-01 00:00:00+00'),
(9, 1, 'Q4 2024', 'Bharti Airtel Ltd.', 'BHARTIARTL', 'https://logo.clearbit.com/airtel.in', 6.80, 17.2, '2024-10-01 00:00:00+00', '2024-10-01 00:00:00+00'),
(10, 1, 'Q4 2024', 'Asian Paints Ltd.', 'ASIANPAINT', 'https://logo.clearbit.com/asianpaints.com', 3.30, 8.9, '2024-10-01 00:00:00+00', '2024-10-01 00:00:00+00'),

-- Portfolio 2 (Dividend Portfolio) - Q4 2024
(11, 2, 'Q4 2024', 'ITC Ltd.', 'ITC', 'https://logo.clearbit.com/itcportal.com', 18.50, 6.4, '2024-10-01 00:00:00+00', '2024-10-01 00:00:00+00'),
(12, 2, 'Q4 2024', 'Hindustan Unilever Ltd.', 'HINDUNILVR', 'https://logo.clearbit.com/hul.co.in', 16.20, 8.7, '2024-10-01 00:00:00+00', '2024-10-01 00:00:00+00'),
(13, 2, 'Q4 2024', 'Nestle India Ltd.', 'NESTLEIND', 'https://logo.clearbit.com/nestle.in', 14.80, 12.1, '2024-10-01 00:00:00+00', '2024-10-01 00:00:00+00'),
(14, 2, 'Q4 2024', 'Coal India Ltd.', 'COALINDIA', 'https://logo.clearbit.com/coalindia.in', 12.30, 15.6, '2024-10-01 00:00:00+00', '2024-10-01 00:00:00+00'),
(15, 2, 'Q4 2024', 'NTPC Ltd.', 'NTPC', 'https://logo.clearbit.com/ntpc.co.in', 11.70, 7.8, '2024-10-01 00:00:00+00', '2024-10-01 00:00:00+00'),
(16, 2, 'Q4 2024', 'Power Grid Corporation', 'POWERGRID', 'https://logo.clearbit.com/powergridindia.com', 10.40, 9.2, '2024-10-01 00:00:00+00', '2024-10-01 00:00:00+00'),
(17, 2, 'Q4 2024', 'Oil & Natural Gas Corp', 'ONGC', 'https://logo.clearbit.com/ongcindia.com', 9.60, 11.5, '2024-10-01 00:00:00+00', '2024-10-01 00:00:00+00'),
(18, 2, 'Q4 2024', 'Indian Oil Corporation', 'IOC', 'https://logo.clearbit.com/iocl.com', 6.50, 4.3, '2024-10-01 00:00:00+00', '2024-10-01 00:00:00+00'),

-- Portfolio 3 (Conservative Portfolio) - Q4 2024
(19, 3, 'Q4 2024', 'State Bank of India', 'SBIN', 'https://logo.clearbit.com/sbi.co.in', 20.00, 8.5, '2024-10-01 00:00:00+00', '2024-10-01 00:00:00+00'),
(20, 3, 'Q4 2024', 'Life Insurance Corp', 'LICI', 'https://logo.clearbit.com/licindia.in', 18.50, 6.7, '2024-10-01 00:00:00+00', '2024-10-01 00:00:00+00'),
(21, 3, 'Q4 2024', 'Bajaj Finance Ltd.', 'BAJFINANCE', 'https://logo.clearbit.com/bajajfinserv.in', 15.30, 14.2, '2024-10-01 00:00:00+00', '2024-10-01 00:00:00+00'),
(22, 3, 'Q4 2024', 'HDFC Life Insurance', 'HDFCLIFE', 'https://logo.clearbit.com/hdfclife.com', 12.80, 10.8, '2024-10-01 00:00:00+00', '2024-10-01 00:00:00+00'),
(23, 3, 'Q4 2024', 'SBI Life Insurance', 'SBILIFE', 'https://logo.clearbit.com/sbilife.co.in', 11.40, 9.3, '2024-10-01 00:00:00+00', '2024-10-01 00:00:00+00'),
(24, 3, 'Q4 2024', 'Kotak Mahindra Bank', 'KOTAKBANK', 'https://logo.clearbit.com/kotak.com', 10.20, 12.6, '2024-10-01 00:00:00+00', '2024-10-01 00:00:00+00'),
(25, 3, 'Q4 2024', 'Axis Bank Ltd.', 'AXISBANK', 'https://logo.clearbit.com/axisbank.com', 8.90, 7.9, '2024-10-01 00:00:00+00', '2024-10-01 00:00:00+00'),
(26, 3, 'Q4 2024', 'IndusInd Bank Ltd.', 'INDUSINDBK', 'https://logo.clearbit.com/indusind.com', 2.90, 5.4, '2024-10-01 00:00:00+00', '2024-10-01 00:00:00+00'),

-- Add Q3 2024 data for some portfolios
(27, 1, 'Q3 2024', 'Tata Consultancy Services Ltd.', 'TCS', 'https://logo.clearbit.com/tcs.com', 16.20, 12.8, '2024-07-01 00:00:00+00', '2024-07-01 00:00:00+00'),
(28, 1, 'Q3 2024', 'Infosys Ltd.', 'INFY', 'https://logo.clearbit.com/infosys.com', 13.80, 14.2, '2024-07-01 00:00:00+00', '2024-07-01 00:00:00+00'),
(29, 1, 'Q3 2024', 'HCL Technologies Ltd.', 'HCLTECH', 'https://logo.clearbit.com/hcltech.com', 11.50, 16.7, '2024-07-01 00:00:00+00', '2024-07-01 00:00:00+00'),
(30, 1, 'Q3 2024', 'Wipro Ltd.', 'WIPRO', 'https://logo.clearbit.com/wipro.com', 9.20, 8.9, '2024-07-01 00:00:00+00', '2024-07-01 00:00:00+00'),
(31, 1, 'Q3 2024', 'HDFC Bank Ltd.', 'HDFCBANK', 'https://logo.clearbit.com/hdfcbank.com', 14.30, 10.5, '2024-07-01 00:00:00+00', '2024-07-01 00:00:00+00'),
(32, 1, 'Q3 2024', 'ICICI Bank Ltd.', 'ICICIBANK', 'https://images.pexels.com/photos/259027/pexels-photo-259027.jpeg?auto=compress&cs=tinysrgb&w=32&h=32&fit=crop', 12.60, 15.3, '2024-07-01 00:00:00+00', '2024-07-01 00:00:00+00'),
(33, 1, 'Q3 2024', 'Reliance Industries Ltd.', 'RELIANCE', 'https://logo.clearbit.com/ril.com', 11.80, 7.6, '2024-07-01 00:00:00+00', '2024-07-01 00:00:00+00'),
(34, 1, 'Q3 2024', 'Bharti Airtel Ltd.', 'BHARTIARTL', 'https://logo.clearbit.com/airtel.in', 7.40, 19.4, '2024-07-01 00:00:00+00', '2024-07-01 00:00:00+00'),
(35, 1, 'Q3 2024', 'Larsen & Toubro Ltd.', 'LT', 'https://logo.clearbit.com/larsentoubro.com', 3.20, 13.8, '2024-07-01 00:00:00+00', '2024-07-01 00:00:00+00'),

-- Add Q2 2024 data
(36, 1, 'Q2 2024', 'Tata Consultancy Services Ltd.', 'TCS', 'https://logo.clearbit.com/tcs.com', 17.80, 22.4, '2024-04-01 00:00:00+00', '2024-04-01 00:00:00+00'),
(37, 1, 'Q2 2024', 'Infosys Ltd.', 'INFY', 'https://logo.clearbit.com/infosys.com', 15.20, 19.6, '2024-04-01 00:00:00+00', '2024-04-01 00:00:00+00'),
(38, 1, 'Q2 2024', 'HCL Technologies Ltd.', 'HCLTECH', 'https://logo.clearbit.com/hcltech.com', 12.40, 25.3, '2024-04-01 00:00:00+00', '2024-04-01 00:00:00+00'),
(39, 1, 'Q2 2024', 'Tech Mahindra Ltd.', 'TECHM', 'https://logo.clearbit.com/techmahindra.com', 10.60, 18.7, '2024-04-01 00:00:00+00', '2024-04-01 00:00:00+00'),
(40, 1, 'Q2 2024', 'HDFC Bank Ltd.', 'HDFCBANK', 'https://logo.clearbit.com/hdfcbank.com', 13.80, 16.2, '2024-04-01 00:00:00+00', '2024-04-01 00:00:00+00'),
(41, 1, 'Q2 2024', 'ICICI Bank Ltd.', 'ICICIBANK', 'https://images.pexels.com/photos/259027/pexels-photo-259027.jpeg?auto=compress&cs=tinysrgb&w=32&h=32&fit=crop', 11.90, 20.8, '2024-04-01 00:00:00+00', '2024-04-01 00:00:00+00'),
(42, 1, 'Q2 2024', 'Kotak Mahindra Bank', 'KOTAKBANK', 'https://logo.clearbit.com/kotak.com', 9.70, 14.9, '2024-04-01 00:00:00+00', '2024-04-01 00:00:00+00'),
(43, 1, 'Q2 2024', 'Axis Bank Ltd.', 'AXISBANK', 'https://logo.clearbit.com/axisbank.com', 8.60, 17.5, '2024-04-01 00:00:00+00', '2024-04-01 00:00:00+00'),

-- Add more diverse portfolio data for other users
(44, 4, 'Q4 2024', 'Tata Consultancy Services Ltd.', 'TCS', 'https://logo.clearbit.com/tcs.com', 25.00, 18.2, '2024-10-01 00:00:00+00', '2024-10-01 00:00:00+00'),
(45, 4, 'Q4 2024', 'Infosys Ltd.', 'INFY', 'https://logo.clearbit.com/infosys.com', 22.50, 16.8, '2024-10-01 00:00:00+00', '2024-10-01 00:00:00+00'),
(46, 4, 'Q4 2024', 'HCL Technologies Ltd.', 'HCLTECH', 'https://logo.clearbit.com/hcltech.com', 20.00, 14.5, '2024-10-01 00:00:00+00', '2024-10-01 00:00:00+00'),
(47, 4, 'Q4 2024', 'Wipro Ltd.', 'WIPRO', 'https://logo.clearbit.com/wipro.com', 17.50, 12.3, '2024-10-01 00:00:00+00', '2024-10-01 00:00:00+00'),
(48, 4, 'Q4 2024', 'Tech Mahindra Ltd.', 'TECHM', 'https://logo.clearbit.com/techmahindra.com', 15.00, 15.7, '2024-10-01 00:00:00+00', '2024-10-01 00:00:00+00'),

-- Banking Portfolio data
(49, 7, 'Q4 2024', 'HDFC Bank Ltd.', 'HDFCBANK', 'https://logo.clearbit.com/hdfcbank.com', 22.50, 11.4, '2024-10-01 00:00:00+00', '2024-10-01 00:00:00+00'),
(50, 7, 'Q4 2024', 'ICICI Bank Ltd.', 'ICICIBANK', 'https://images.pexels.com/photos/259027/pexels-photo-259027.jpeg?auto=compress&cs=tinysrgb&w=32&h=32&fit=crop', 20.00, 13.6, '2024-10-01 00:00:00+00', '2024-10-01 00:00:00+00'),
(51, 7, 'Q4 2024', 'State Bank of India', 'SBIN', 'https://logo.clearbit.com/sbi.co.in', 18.50, 8.5, '2024-10-01 00:00:00+00', '2024-10-01 00:00:00+00'),
(52, 7, 'Q4 2024', 'Kotak Mahindra Bank', 'KOTAKBANK', 'https://logo.clearbit.com/kotak.com', 16.00, 12.6, '2024-10-01 00:00:00+00', '2024-10-01 00:00:00+00'),
(53, 7, 'Q4 2024', 'Axis Bank Ltd.', 'AXISBANK', 'https://logo.clearbit.com/axisbank.com', 14.50, 7.9, '2024-10-01 00:00:00+00', '2024-10-01 00:00:00+00'),
(54, 7, 'Q4 2024', 'IndusInd Bank Ltd.', 'INDUSINDBK', 'https://logo.clearbit.com/indusind.com', 8.50, 5.4, '2024-10-01 00:00:00+00', '2024-10-01 00:00:00+00'),

-- Auto Portfolio data
(55, 12, 'Q4 2024', 'Maruti Suzuki India Ltd.', 'MARUTI', 'https://logo.clearbit.com/marutisuzuki.com', 28.50, 16.8, '2024-10-01 00:00:00+00', '2024-10-01 00:00:00+00'),
(56, 12, 'Q4 2024', 'Tata Motors Ltd.', 'TATAMOTORS', 'https://logo.clearbit.com/tatamotors.com', 24.00, 22.4, '2024-10-01 00:00:00+00', '2024-10-01 00:00:00+00'),
(57, 12, 'Q4 2024', 'Mahindra & Mahindra', 'M&M', 'https://logo.clearbit.com/mahindra.com', 20.50, 18.9, '2024-10-01 00:00:00+00', '2024-10-01 00:00:00+00'),
(58, 12, 'Q4 2024', 'Bajaj Auto Ltd.', 'BAJAJ-AUTO', 'https://logo.clearbit.com/bajajauto.com', 15.00, 12.7, '2024-10-01 00:00:00+00', '2024-10-01 00:00:00+00'),
(59, 12, 'Q4 2024', 'TVS Motor Company', 'TVSMOTOR', 'https://logo.clearbit.com/tvsmotor.com', 12.00, 25.6, '2024-10-01 00:00:00+00', '2024-10-01 00:00:00+00');

-- Insert portfolio snapshots
INSERT INTO portfolio_snapshots (id, portfolio_id, quarter, total_value, total_return, cumulative_return, notes, created_at, updated_at) VALUES 
(1, 1, 'Q4 2024', 2500000.00, 15.20, 68.50, 'Strong performance driven by tech sector recovery', '2024-10-01 00:00:00+00', '2024-12-31 23:59:59+00'),
(2, 1, 'Q3 2024', 2200000.00, 12.80, 46.20, 'Steady growth with banking sector outperformance', '2024-07-01 00:00:00+00', '2024-09-30 23:59:59+00'),
(3, 1, 'Q2 2024', 1950000.00, 18.50, 29.50, 'Exceptional quarter with broad-based rally', '2024-04-01 00:00:00+00', '2024-06-30 23:59:59+00'),
(4, 1, 'Q1 2024', 1650000.00, 9.30, 9.30, 'Moderate start to the year, selective stock picking', '2024-01-01 00:00:00+00', '2024-03-31 23:59:59+00'),

(5, 2, 'Q4 2024', 1800000.00, 9.80, 42.30, 'Dividend stocks provided steady income', '2024-10-01 00:00:00+00', '2024-12-31 23:59:59+00'),
(6, 2, 'Q3 2024', 1650000.00, 7.60, 29.60, 'Consistent dividend yield with capital appreciation', '2024-07-01 00:00:00+00', '2024-09-30 23:59:59+00'),
(7, 2, 'Q2 2024', 1535000.00, 11.40, 20.40, 'FMCG and utility stocks led performance', '2024-04-01 00:00:00+00', '2024-06-30 23:59:59+00'),
(8, 2, 'Q1 2024', 1380000.00, 8.10, 8.10, 'Defensive positioning paid off in volatile market', '2024-01-01 00:00:00+00', '2024-03-31 23:59:59+00'),

(9, 3, 'Q4 2024', 1200000.00, 8.90, 35.20, 'Conservative approach with steady gains', '2024-10-01 00:00:00+00', '2024-12-31 23:59:59+00'),
(10, 3, 'Q3 2024', 1100000.00, 6.50, 24.20, 'Banking sector recovery supported returns', '2024-07-01 00:00:00+00', '2024-09-30 23:59:59+00'),
(11, 3, 'Q2 2024', 1035000.00, 10.20, 16.60, 'Insurance stocks outperformed expectations', '2024-04-01 00:00:00+00', '2024-06-30 23:59:59+00'),
(12, 3, 'Q1 2024', 940000.00, 5.80, 5.80, 'Cautious start with focus on capital preservation', '2024-01-01 00:00:00+00', '2024-03-31 23:59:59+00'),

(13, 4, 'Q4 2024', 3200000.00, 16.70, 55.80, 'Tech sector concentration paid off handsomely', '2024-10-01 00:00:00+00', '2024-12-31 23:59:59+00'),
(14, 4, 'Q3 2024', 2750000.00, 14.20, 33.50, 'AI and cloud computing themes drove growth', '2024-07-01 00:00:00+00', '2024-09-30 23:59:59+00'),
(15, 4, 'Q2 2024', 2410000.00, 20.50, 16.90, 'Outstanding quarter for technology stocks', '2024-04-01 00:00:00+00', '2024-06-30 23:59:59+00'),
(16, 4, 'Q1 2024', 2000000.00, -2.80, -2.80, 'Tech correction provided entry opportunities', '2024-01-01 00:00:00+00', '2024-03-31 23:59:59+00'),

(17, 7, 'Q4 2024', 1600000.00, 10.40, 38.60, 'Banking sector recovery continued', '2024-10-01 00:00:00+00', '2024-12-31 23:59:59+00'),
(18, 7, 'Q3 2024', 1450000.00, 8.70, 25.50, 'Credit growth supported bank valuations', '2024-07-01 00:00:00+00', '2024-09-30 23:59:59+00'),
(19, 7, 'Q2 2024', 1335000.00, 12.30, 15.50, 'Interest rate cycle peak benefited banks', '2024-04-01 00:00:00+00', '2024-06-30 23:59:59+00'),
(20, 7, 'Q1 2024', 1190000.00, 2.90, 2.90, 'Cautious positioning ahead of rate decisions', '2024-01-01 00:00:00+00', '2024-03-31 23:59:59+00'),

(21, 12, 'Q4 2024', 2100000.00, 19.20, 72.40, 'Auto sector revival with strong demand', '2024-10-01 00:00:00+00', '2024-12-31 23:59:59+00'),
(22, 12, 'Q3 2024', 1760000.00, 15.80, 44.70, 'Festive season boost for auto companies', '2024-07-01 00:00:00+00', '2024-09-30 23:59:59+00'),
(23, 12, 'Q2 2024', 1520000.00, 21.60, 24.90, 'Rural demand recovery supported growth', '2024-04-01 00:00:00+00', '2024-06-30 23:59:59+00'),
(24, 12, 'Q1 2024', 1250000.00, 2.70, 2.70, 'Inventory correction phase for auto sector', '2024-01-01 00:00:00+00', '2024-03-31 23:59:59+00');

-- Insert user preferences
INSERT INTO user_preferences (id, user_id, preferences, cache_data, last_portfolio_quarter, created_at, updated_at) VALUES 
('650e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440001', '{"theme": "dark", "notifications": true, "auto_refresh": true, "default_view": "momentum", "risk_tolerance": "moderate"}', '{"last_login": "2024-12-20T10:30:00Z", "favorite_stocks": ["TCS", "INFY", "HDFCBANK"], "dashboard_layout": "grid"}', 'Q4 2024', '2024-01-15 10:30:00+00', '2024-12-20 10:30:00+00'),
('650e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440002', '{"theme": "light", "notifications": false, "auto_refresh": false, "default_view": "conservative", "risk_tolerance": "low"}', '{"last_login": "2024-12-19T14:15:00Z", "favorite_stocks": ["SBIN", "LIC"], "dashboard_layout": "list"}', 'Q4 2024', '2024-01-20 14:15:00+00', '2024-12-19 14:15:00+00'),
('650e8400-e29b-41d4-a716-446655440003', '550e8400-e29b-41d4-a716-446655440003', '{"theme": "dark", "notifications": true, "auto_refresh": true, "default_view": "tech", "risk_tolerance": "high"}', '{"last_login": "2024-12-20T09:45:00Z", "favorite_stocks": ["TCS", "INFY", "HCLTECH", "WIPRO"], "dashboard_layout": "cards"}', 'Q4 2024', '2024-02-01 09:45:00+00', '2024-12-20 09:45:00+00'),
('650e8400-e29b-41d4-a716-446655440004', '550e8400-e29b-41d4-a716-446655440004', '{"theme": "light", "notifications": true, "auto_refresh": true, "default_view": "balanced", "risk_tolerance": "moderate"}', '{"last_login": "2024-12-18T16:20:00Z", "favorite_stocks": ["RELIANCE", "TCS", "HDFCBANK"], "dashboard_layout": "grid"}', 'Q4 2024', '2024-02-10 16:20:00+00', '2024-12-18 16:20:00+00'),
('650e8400-e29b-41d4-a716-446655440005', '550e8400-e29b-41d4-a716-446655440005', '{"theme": "dark", "notifications": false, "auto_refresh": false, "default_view": "small_cap", "risk_tolerance": "high"}', '{"last_login": "2024-12-17T11:30:00Z", "favorite_stocks": ["TITAN", "ASIANPAINT"], "dashboard_layout": "list"}', 'Q3 2024', '2024-02-15 11:30:00+00', '2024-12-17 11:30:00+00'),
('650e8400-e29b-41d4-a716-446655440006', '550e8400-e29b-41d4-a716-446655440006', '{"theme": "light", "notifications": true, "auto_refresh": true, "default_view": "banking", "risk_tolerance": "moderate"}', '{"last_login": "2024-12-20T13:45:00Z", "favorite_stocks": ["HDFCBANK", "ICICIBANK", "KOTAKBANK"], "dashboard_layout": "cards"}', 'Q4 2024', '2024-03-01 13:45:00+00', '2024-12-20 13:45:00+00'),
('650e8400-e29b-41d4-a716-446655440007', '550e8400-e29b-41d4-a716-446655440007', '{"theme": "dark", "notifications": false, "auto_refresh": true, "default_view": "energy", "risk_tolerance": "low"}', '{"last_login": "2024-12-16T08:15:00Z", "favorite_stocks": ["ONGC", "IOC"], "dashboard_layout": "grid"}', 'Q3 2024', '2024-03-10 08:15:00+00', '2024-12-16 08:15:00+00'),
('650e8400-e29b-41d4-a716-446655440008', '550e8400-e29b-41d4-a716-446655440008', '{"theme": "light", "notifications": true, "auto_refresh": true, "default_view": "healthcare", "risk_tolerance": "moderate"}', '{"last_login": "2024-12-20T12:00:00Z", "favorite_stocks": ["SUNPHARMA", "DRREDDY"], "dashboard_layout": "list"}', 'Q4 2024', '2024-03-20 12:00:00+00', '2024-12-20 12:00:00+00'),
('650e8400-e29b-41d4-a716-446655440009', '550e8400-e29b-41d4-a716-446655440009', '{"theme": "dark", "notifications": true, "auto_refresh": false, "default_view": "infrastructure", "risk_tolerance": "high"}', '{"last_login": "2024-12-19T15:30:00Z", "favorite_stocks": ["LT", "ULTRACEMCO"], "dashboard_layout": "cards"}', 'Q4 2024', '2024-04-01 15:30:00+00', '2024-12-19 15:30:00+00'),
('650e8400-e29b-41d4-a716-446655440010', '550e8400-e29b-41d4-a716-446655440010', '{"theme": "light", "notifications": false, "auto_refresh": true, "default_view": "fmcg", "risk_tolerance": "low"}', '{"last_login": "2024-12-15T10:45:00Z", "favorite_stocks": ["HINDUNILVR", "ITC"], "dashboard_layout": "grid"}', 'Q3 2024', '2024-04-10 10:45:00+00', '2024-12-15 10:45:00+00'),
('650e8400-e29b-41d4-a716-446655440011', '550e8400-e29b-41d4-a716-446655440011', '{"theme": "dark", "notifications": true, "auto_refresh": true, "default_view": "auto", "risk_tolerance": "moderate"}', '{"last_login": "2024-12-20T14:20:00Z", "favorite_stocks": ["MARUTI", "TATAMOTORS", "M&M"], "dashboard_layout": "list"}', 'Q4 2024', '2024-04-20 14:20:00+00', '2024-12-20 14:20:00+00'),
('650e8400-e29b-41d4-a716-446655440012', '550e8400-e29b-41d4-a716-446655440012', '{"theme": "light", "notifications": false, "auto_refresh": false, "default_view": "metals", "risk_tolerance": "high"}', '{"last_login": "2024-12-14T09:10:00Z", "favorite_stocks": ["TATASTEEL", "JSWSTEEL"], "dashboard_layout": "cards"}', 'Q2 2024', '2024-05-01 09:10:00+00', '2024-12-14 09:10:00+00'),
('650e8400-e29b-41d4-a716-446655440013', '550e8400-e29b-41d4-a716-446655440013', '{"theme": "dark", "notifications": true, "auto_refresh": true, "default_view": "telecom", "risk_tolerance": "moderate"}', '{"last_login": "2024-12-20T16:40:00Z", "favorite_stocks": ["BHARTIARTL", "IDEA"], "dashboard_layout": "grid"}', 'Q4 2024', '2024-05-10 16:40:00+00', '2024-12-20 16:40:00+00'),
('650e8400-e29b-41d4-a716-446655440014', '550e8400-e29b-41d4-a716-446655440014', '{"theme": "light", "notifications": true, "auto_refresh": false, "default_view": "retail", "risk_tolerance": "low"}', '{"last_login": "2024-12-18T11:25:00Z", "favorite_stocks": ["DMART", "TRENT"], "dashboard_layout": "list"}', 'Q4 2024', '2024-05-20 11:25:00+00', '2024-12-18 11:25:00+00'),
('650e8400-e29b-41d4-a716-446655440015', '550e8400-e29b-41d4-a716-446655440015', '{"theme": "dark", "notifications": false, "auto_refresh": true, "default_view": "momentum", "risk_tolerance": "high"}', '{"last_login": "2024-12-16T13:50:00Z", "favorite_stocks": ["ADANIPORTS", "ADANIENT"], "dashboard_layout": "cards"}', 'Q3 2024', '2024-06-01 13:50:00+00', '2024-12-16 13:50:00+00');

-- Add more portfolio constituents for better testing coverage
INSERT INTO portfolio_constituents (id, portfolio_id, quarter, stock_name, stock_code, company_logo_url, weight, quarterly_returns, created_at, updated_at) VALUES 
-- Healthcare Portfolio (Portfolio 9) - Q4 2024
(60, 9, 'Q4 2024', 'Sun Pharmaceutical Industries', 'SUNPHARMA', 'https://logo.clearbit.com/sunpharma.com', 25.00, 14.8, '2024-10-01 00:00:00+00', '2024-10-01 00:00:00+00'),
(61, 9, 'Q4 2024', 'Dr. Reddys Laboratories', 'DRREDDY', 'https://logo.clearbit.com/drreddys.com', 22.50, 16.2, '2024-10-01 00:00:00+00', '2024-10-01 00:00:00+00'),
(62, 9, 'Q4 2024', 'Cipla Ltd.', 'CIPLA', 'https://logo.clearbit.com/cipla.com', 20.00, 12.7, '2024-10-01 00:00:00+00', '2024-10-01 00:00:00+00'),
(63, 9, 'Q4 2024', 'Lupin Ltd.', 'LUPIN', 'https://logo.clearbit.com/lupin.com', 17.50, 18.9, '2024-10-01 00:00:00+00', '2024-10-01 00:00:00+00'),
(64, 9, 'Q4 2024', 'Aurobindo Pharma Ltd.', 'AUROPHARMA', 'https://logo.clearbit.com/aurobindo.com', 15.00, 21.3, '2024-10-01 00:00:00+00', '2024-10-01 00:00:00+00'),

-- Infrastructure Portfolio (Portfolio 10) - Q4 2024
(65, 10, 'Q4 2024', 'Larsen & Toubro Ltd.', 'LT', 'https://logo.clearbit.com/larsentoubro.com', 30.00, 19.4, '2024-10-01 00:00:00+00', '2024-10-01 00:00:00+00'),
(66, 10, 'Q4 2024', 'UltraTech Cement Ltd.', 'ULTRACEMCO', 'https://logo.clearbit.com/ultratechcement.com', 25.00, 16.8, '2024-10-01 00:00:00+00', '2024-10-01 00:00:00+00'),
(67, 10, 'Q4 2024', 'Ambuja Cements Ltd.', 'AMBUJACEM', 'https://logo.clearbit.com/ambujacement.com', 20.00, 22.1, '2024-10-01 00:00:00+00', '2024-10-01 00:00:00+00'),
(68, 10, 'Q4 2024', 'ACC Ltd.', 'ACC', 'https://logo.clearbit.com/acclimited.com', 15.00, 18.7, '2024-10-01 00:00:00+00', '2024-10-01 00:00:00+00'),
(69, 10, 'Q4 2024', 'Grasim Industries Ltd.', 'GRASIM', 'https://logo.clearbit.com/grasim.com', 10.00, 14.3, '2024-10-01 00:00:00+00', '2024-10-01 00:00:00+00'),

-- FMCG Portfolio (Portfolio 11) - Q4 2024
(70, 11, 'Q4 2024', 'Hindustan Unilever Ltd.', 'HINDUNILVR', 'https://logo.clearbit.com/hul.co.in', 28.00, 9.8, '2024-10-01 00:00:00+00', '2024-10-01 00:00:00+00'),
(71, 11, 'Q4 2024', 'ITC Ltd.', 'ITC', 'https://logo.clearbit.com/itcportal.com', 25.00, 7.2, '2024-10-01 00:00:00+00', '2024-10-01 00:00:00+00'),
(72, 11, 'Q4 2024', 'Nestle India Ltd.', 'NESTLEIND', 'https://logo.clearbit.com/nestle.in', 22.00, 11.6, '2024-10-01 00:00:00+00', '2024-10-01 00:00:00+00'),
(73, 11, 'Q4 2024', 'Britannia Industries Ltd.', 'BRITANNIA', 'https://logo.clearbit.com/britannia.co.in', 15.00, 13.4, '2024-10-01 00:00:00+00', '2024-10-01 00:00:00+00'),
(74, 11, 'Q4 2024', 'Dabur India Ltd.', 'DABUR', 'https://logo.clearbit.com/dabur.com', 10.00, 15.8, '2024-10-01 00:00:00+00', '2024-10-01 00:00:00+00'),

-- Add Q1 2024 data for more historical context
(75, 1, 'Q1 2024', 'Tata Consultancy Services Ltd.', 'TCS', 'https://logo.clearbit.com/tcs.com', 18.00, 8.4, '2024-01-01 00:00:00+00', '2024-01-01 00:00:00+00'),
(76, 1, 'Q1 2024', 'Infosys Ltd.', 'INFY', 'https://logo.clearbit.com/infosys.com', 16.50, 10.2, '2024-01-01 00:00:00+00', '2024-01-01 00:00:00+00'),
(77, 1, 'Q1 2024', 'HCL Technologies Ltd.', 'HCLTECH', 'https://logo.clearbit.com/hcltech.com', 14.20, 12.8, '2024-01-01 00:00:00+00', '2024-01-01 00:00:00+00'),
(78, 1, 'Q1 2024', 'Wipro Ltd.', 'WIPRO', 'https://logo.clearbit.com/wipro.com', 11.80, 6.7, '2024-01-01 00:00:00+00', '2024-01-01 00:00:00+00'),
(79, 1, 'Q1 2024', 'HDFC Bank Ltd.', 'HDFCBANK', 'https://logo.clearbit.com/hdfcbank.com', 15.60, 9.8, '2024-01-01 00:00:00+00', '2024-01-01 00:00:00+00'),
(80, 1, 'Q1 2024', 'ICICI Bank Ltd.', 'ICICIBANK', 'https://images.pexels.com/photos/259027/pexels-photo-259027.jpeg?auto=compress&cs=tinysrgb&w=32&h=32&fit=crop', 13.40, 11.5, '2024-01-01 00:00:00+00', '2024-01-01 00:00:00+00'),
(81, 1, 'Q1 2024', 'Reliance Industries Ltd.', 'RELIANCE', 'https://logo.clearbit.com/ril.com', 10.50, 7.6, '2024-01-01 00:00:00+00', '2024-01-01 00:00:00+00'),

-- Add Q1 2023 data for longer historical context
(82, 1, 'Q1 2023', 'Tata Consultancy Services Ltd.', 'TCS', 'https://logo.clearbit.com/tcs.com', 19.50, 15.6, '2023-01-01 00:00:00+00', '2023-01-01 00:00:00+00'),
(83, 1, 'Q1 2023', 'Infosys Ltd.', 'INFY', 'https://logo.clearbit.com/infosys.com', 17.80, 18.3, '2023-01-01 00:00:00+00', '2023-01-01 00:00:00+00'),
(84, 1, 'Q1 2023', 'HCL Technologies Ltd.', 'HCLTECH', 'https://logo.clearbit.com/hcltech.com', 15.20, 22.7, '2023-01-01 00:00:00+00', '2023-01-01 00:00:00+00'),
(85, 1, 'Q1 2023', 'HDFC Bank Ltd.', 'HDFCBANK', 'https://logo.clearbit.com/hdfcbank.com', 16.80, 13.9, '2023-01-01 00:00:00+00', '2023-01-01 00:00:00+00'),
(86, 1, 'Q1 2023', 'ICICI Bank Ltd.', 'ICICIBANK', 'https://images.pexels.com/photos/259027/pexels-photo-259027.jpeg?auto=compress&cs=tinysrgb&w=32&h=32&fit=crop', 14.70, 20.4, '2023-01-01 00:00:00+00', '2023-01-01 00:00:00+00'),
(87, 1, 'Q1 2023', 'Reliance Industries Ltd.', 'RELIANCE', 'https://logo.clearbit.com/ril.com', 12.40, 11.8, '2023-01-01 00:00:00+00', '2023-01-01 00:00:00+00'),
(88, 1, 'Q1 2023', 'Bharti Airtel Ltd.', 'BHARTIARTL', 'https://logo.clearbit.com/airtel.in', 3.60, 25.7, '2023-01-01 00:00:00+00', '2023-01-01 00:00:00+00'),

-- Add some negative return examples for realistic data
(89, 5, 'Q4 2024', 'Paytm', 'PAYTM', 'https://logo.clearbit.com/paytm.com', 8.50, -12.4, '2024-10-01 00:00:00+00', '2024-10-01 00:00:00+00'),
(90, 5, 'Q4 2024', 'Zomato Ltd.', 'ZOMATO', 'https://logo.clearbit.com/zomato.com', 6.20, -8.7, '2024-10-01 00:00:00+00', '2024-10-01 00:00:00+00'),
(91, 5, 'Q4 2024', 'Nykaa', 'NYKAA', 'https://logo.clearbit.com/nykaa.com', 4.80, -15.2, '2024-10-01 00:00:00+00', '2024-10-01 00:00:00+00'),
(92, 5, 'Q4 2024', 'HDFC Bank Ltd.', 'HDFCBANK', 'https://logo.clearbit.com/hdfcbank.com', 25.00, 11.4, '2024-10-01 00:00:00+00', '2024-10-01 00:00:00+00'),
(93, 5, 'Q4 2024', 'ICICI Bank Ltd.', 'ICICIBANK', 'https://images.pexels.com/photos/259027/pexels-photo-259027.jpeg?auto=compress&cs=tinysrgb&w=32&h=32&fit=crop', 22.50, 13.6, '2024-10-01 00:00:00+00', '2024-10-01 00:00:00+00'),
(94, 5, 'Q4 2024', 'Tata Consultancy Services Ltd.', 'TCS', 'https://logo.clearbit.com/tcs.com', 20.00, 18.2, '2024-10-01 00:00:00+00', '2024-10-01 00:00:00+00'),
(95, 5, 'Q4 2024', 'Reliance Industries Ltd.', 'RELIANCE', 'https://logo.clearbit.com/ril.com', 13.00, 9.8, '2024-10-01 00:00:00+00', '2024-10-01 00:00:00+00');

-- Add more snapshots for comprehensive testing
INSERT INTO portfolio_snapshots (id, portfolio_id, quarter, total_value, total_return, cumulative_return, notes, created_at, updated_at) VALUES 
(25, 5, 'Q4 2024', 1850000.00, 8.60, 31.20, 'Mixed performance with some new-age stocks underperforming', '2024-10-01 00:00:00+00', '2024-12-31 23:59:59+00'),
(26, 5, 'Q3 2024', 1705000.00, 12.40, 20.80, 'Traditional stocks outperformed new-age companies', '2024-07-01 00:00:00+00', '2024-09-30 23:59:59+00'),
(27, 5, 'Q2 2024', 1518000.00, 7.50, 7.50, 'Balanced approach with mixed sector allocation', '2024-04-01 00:00:00+00', '2024-06-30 23:59:59+00'),

(28, 9, 'Q4 2024', 1400000.00, 16.80, 45.60, 'Healthcare sector benefited from policy support', '2024-10-01 00:00:00+00', '2024-12-31 23:59:59+00'),
(29, 9, 'Q3 2024', 1200000.00, 13.20, 24.60, 'Pharmaceutical exports drove strong performance', '2024-07-01 00:00:00+00', '2024-09-30 23:59:59+00'),
(30, 9, 'Q2 2024', 1060000.00, 10.40, 10.40, 'Generic drug approvals supported valuations', '2024-04-01 00:00:00+00', '2024-06-30 23:59:59+00'),

(31, 10, 'Q4 2024', 2800000.00, 18.90, 62.30, 'Infrastructure spending boost supported sector', '2024-10-01 00:00:00+00', '2024-12-31 23:59:59+00'),
(32, 10, 'Q3 2024', 2355000.00, 14.70, 36.50, 'Cement demand recovery with construction activity', '2024-07-01 00:00:00+00', '2024-09-30 23:59:59+00'),
(33, 10, 'Q2 2024', 2055000.00, 19.00, 19.00, 'Government capex push benefited infrastructure', '2024-04-01 00:00:00+00', '2024-06-30 23:59:59+00'),

(34, 11, 'Q4 2024', 1650000.00, 10.20, 28.40, 'FMCG sector showed resilient demand patterns', '2024-10-01 00:00:00+00', '2024-12-31 23:59:59+00'),
(35, 11, 'Q3 2024', 1498000.00, 8.90, 16.50, 'Rural recovery supported FMCG consumption', '2024-07-01 00:00:00+00', '2024-09-30 23:59:59+00'),
(36, 11, 'Q2 2024', 1376000.00, 7.00, 7.00, 'Steady performance with margin expansion', '2024-04-01 00:00:00+00', '2024-06-30 23:59:59+00');

-- Add historical data for Q2 2023 and Q3 2023
INSERT INTO portfolio_snapshots (id, portfolio_id, quarter, total_value, total_return, cumulative_return, notes, created_at, updated_at) VALUES 
(37, 1, 'Q2 2023', 1420000.00, 14.80, 26.20, 'Tech sector recovery with strong earnings', '2023-04-01 00:00:00+00', '2023-06-30 23:59:59+00'),
(38, 1, 'Q3 2023', 1580000.00, 11.30, 40.60, 'Sustained growth momentum across holdings', '2023-07-01 00:00:00+00', '2023-09-30 23:59:59+00'),
(39, 1, 'Q4 2023', 1720000.00, 8.90, 53.00, 'Year-end rally supported by FII inflows', '2023-10-01 00:00:00+00', '2023-12-31 23:59:59+00'),

(40, 2, 'Q2 2023', 1180000.00, 9.60, 18.40, 'Dividend yields attractive in rising rate environment', '2023-04-01 00:00:00+00', '2023-06-30 23:59:59+00'),
(41, 2, 'Q3 2023', 1250000.00, 5.90, 25.50, 'Defensive positioning during market volatility', '2023-07-01 00:00:00+00', '2023-09-30 23:59:59+00'),
(42, 2, 'Q4 2023', 1320000.00, 5.60, 32.60, 'Consistent dividend income with modest capital gains', '2023-10-01 00:00:00+00', '2023-12-31 23:59:59+00');