import { createClient } from '@supabase/supabase-js';

const supabaseUrl = import.meta.env.VITE_SUPABASE_URL;
const supabaseAnonKey = import.meta.env.VITE_SUPABASE_ANON_KEY;

if (!supabaseUrl || !supabaseAnonKey) {
  throw new Error('Missing Supabase environment variables');
}

export const supabase = createClient(supabaseUrl, supabaseAnonKey);

// Database types
export interface PortfolioHolding {
  id: string;
  stock_symbol: string;
  company_name: string;
  shares: number;
  purchase_price: number;
  current_price: number;
  quarter: string;
  year: number;
  created_at: string;
  updated_at: string;
}