import { supabase, PortfolioHolding } from '../lib/supabase';

export interface PortfolioSummary {
  totalValue: number;
  totalGainLoss: number;
  totalGainLossPercent: number;
  totalShares: number;
  quarterlyPerformance: { quarter: string; performance: number }[];
}

class PortfolioService {
  private cache: Map<string, { data: any; timestamp: number }> = new Map();
  private readonly CACHE_DURATION = 5 * 60 * 1000; // 5 minutes

  /**
   * Get portfolio holdings for a specific quarter (public access)
   */
  async getPortfolio(quarter?: string, year?: number): Promise<PortfolioHolding[]> {
    try {
      let query = supabase
        .from('portfolio_holdings')
        .select('*')
        .order('created_at', { ascending: false });

      if (quarter) {
        query = query.eq('quarter', quarter);
      }

      if (year) {
        query = query.eq('year', year);
      }

      const { data, error } = await query;

      if (error) {
        throw error;
      }

      return data || [];
    } catch (error) {
      console.error('Error fetching portfolio:', error);
      throw error;
    }
  }

  /**
   * Get portfolio summary with calculations (public access)
   */
  async getPortfolioSummary(): Promise<PortfolioSummary> {
    try {
      const holdings = await this.getPortfolio();
      
      let totalValue = 0;
      let totalCost = 0;
      let totalShares = 0;

      holdings.forEach(holding => {
        const currentValue = holding.shares * holding.current_price;
        const costBasis = holding.shares * holding.purchase_price;
        
        totalValue += currentValue;
        totalCost += costBasis;
        totalShares += holding.shares;
      });

      const totalGainLoss = totalValue - totalCost;
      const totalGainLossPercent = totalCost > 0 ? (totalGainLoss / totalCost) * 100 : 0;

      // Calculate quarterly performance
      const quarterlyData = await this.getQuarterlyPerformance();

      return {
        totalValue,
        totalGainLoss,
        totalGainLossPercent,
        totalShares,
        quarterlyPerformance: quarterlyData
      };
    } catch (error) {
      console.error('Error calculating portfolio summary:', error);
      throw error;
    }
  }

  /**
   * Get quarterly performance data (public access)
   */
  async getQuarterlyPerformance(): Promise<{ quarter: string; performance: number }[]> {
    try {
      const { data, error } = await supabase
        .from('portfolio_holdings')
        .select('quarter, year, shares, purchase_price, current_price');

      if (error) {
        throw error;
      }

      const quarterMap = new Map<string, { totalValue: number; totalCost: number }>();

      data?.forEach(holding => {
        const quarterKey = `${holding.quarter} ${holding.year}`;
        const currentValue = holding.shares * holding.current_price;
        const costBasis = holding.shares * holding.purchase_price;

        const existing = quarterMap.get(quarterKey) || { totalValue: 0, totalCost: 0 };
        quarterMap.set(quarterKey, {
          totalValue: existing.totalValue + currentValue,
          totalCost: existing.totalCost + costBasis
        });
      });

      return Array.from(quarterMap.entries()).map(([quarter, data]) => ({
        quarter,
        performance: data.totalCost > 0 ? ((data.totalValue - data.totalCost) / data.totalCost) * 100 : 0
      })).sort((a, b) => b.quarter.localeCompare(a.quarter));
    } catch (error) {
      console.error('Error fetching quarterly performance:', error);
      return [];
    }
  }

  /**
   * Get available quarters (public access)
   */
  async getAvailableQuarters(): Promise<string[]> {
    try {
      const { data, error } = await supabase
        .from('portfolio_holdings')
        .select('quarter, year');

      if (error) {
        throw error;
      }

      const quarters = [...new Set(data?.map(item => `${item.quarter} ${item.year}`) || [])];
      return quarters.sort().reverse();
    } catch (error) {
      console.error('Error fetching quarters:', error);
      return [];
    }
  }

  /**
   * Subscribe to real-time portfolio updates (public access)
   */
  subscribeToPortfolioUpdates(callback: (payload: any) => void) {
    return supabase
      .channel('portfolio_public')
      .on(
        'postgres_changes',
        {
          event: '*',
          schema: 'public',
          table: 'portfolio_holdings'
        },
        callback
      )
      .subscribe();
  }

  /**
   * Clear cache
   */
  clearCache(): void {
    this.cache.clear();
  }
}

export const portfolioService = new PortfolioService();