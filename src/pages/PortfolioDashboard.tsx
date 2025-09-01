import React, { useState, useEffect } from 'react';
import { TrendingUp, TrendingDown, BarChart3, RefreshCw, AlertCircle, DollarSign, Activity } from 'lucide-react';
import { portfolioService, PortfolioSummary } from '../services/portfolioService';
import { PortfolioHolding } from '../lib/supabase';
import Header from '../components/Header';
import Footer from '../components/Footer';

const PortfolioDashboard: React.FC = () => {
  const [holdings, setHoldings] = useState<PortfolioHolding[]>([]);
  const [summary, setSummary] = useState<PortfolioSummary | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [selectedQuarter, setSelectedQuarter] = useState<string>('');
  const [availableQuarters, setAvailableQuarters] = useState<string[]>([]);
  const [isRefreshing, setIsRefreshing] = useState(false);
  const [connectionStatus, setConnectionStatus] = useState<'connected' | 'connecting' | 'disconnected'>('connecting');

  useEffect(() => {
    loadPortfolioData();
    setupRealtimeSubscription();
  }, []);

  const loadPortfolioData = async () => {
    try {
      setLoading(true);
      setError(null);
      setConnectionStatus('connecting');

      // Load available quarters
      const quarters = await portfolioService.getAvailableQuarters();
      setAvailableQuarters(quarters);
      
      // Set default quarter if not selected
      const defaultQuarter = quarters[0] || '';
      if (!selectedQuarter && defaultQuarter) {
        setSelectedQuarter(defaultQuarter);
      }

      // Load holdings for selected quarter
      const [quarter, year] = (selectedQuarter || defaultQuarter).split(' ');
      const portfolioData = await portfolioService.getPortfolio(
        quarter, 
        year ? parseInt(year) : undefined
      );
      setHoldings(portfolioData);

      // Load portfolio summary
      const summaryData = await portfolioService.getPortfolioSummary();
      setSummary(summaryData);

      setConnectionStatus('connected');
    } catch (error) {
      console.error('Error loading portfolio data:', error);
      setError('Failed to load portfolio data. Please try again.');
      setConnectionStatus('disconnected');
    } finally {
      setLoading(false);
    }
  };

  const setupRealtimeSubscription = () => {
    const subscription = portfolioService.subscribeToPortfolioUpdates(
      (payload) => {
        console.log('Real-time update received:', payload);
        setConnectionStatus('connected');
        // Refresh data when changes occur
        loadPortfolioData();
      }
    );

    return () => {
      subscription.unsubscribe();
    };
  };

  const handleRefresh = async () => {
    setIsRefreshing(true);
    try {
      await loadPortfolioData();
    } finally {
      setIsRefreshing(false);
    }
  };

  const handleQuarterChange = (quarter: string) => {
    setSelectedQuarter(quarter);
    // Reload data for new quarter
    const [q, y] = quarter.split(' ');
    portfolioService.getPortfolio(q, y ? parseInt(y) : undefined)
      .then(setHoldings)
      .catch(error => {
        console.error('Error loading quarter data:', error);
        setError('Failed to load data for selected quarter');
      });
  };

  if (loading) {
    return (
      <div className="min-h-screen bg-gray-50">
        <Header />
        <div className="container mx-auto px-4 py-8">
          <div className="bg-white rounded-lg shadow-lg p-8">
            <div className="text-center">
              <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-blue-600 mx-auto mb-4"></div>
              <p className="text-lg font-medium">Loading portfolio data...</p>
            </div>
          </div>
        </div>
        <Footer />
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-gray-50">
      <Header />
      
      {/* Hero Section */}
      <div className="bg-gradient-to-br from-blue-600 to-blue-800 text-white py-12">
        <div className="container mx-auto px-4">
          <div className="flex items-center justify-between">
            <div>
              <h1 className="text-3xl font-bold mb-2">Portfolio Dashboard</h1>
              <p className="text-blue-100">AI-powered stock portfolio performance</p>
            </div>
            <div className="flex items-center space-x-4">
              <div className="flex items-center space-x-2">
                <div className={`w-3 h-3 rounded-full ${
                  connectionStatus === 'connected' ? 'bg-green-400' : 
                  connectionStatus === 'connecting' ? 'bg-yellow-400' : 'bg-red-400'
                }`}></div>
                <span className="text-sm">
                  {connectionStatus === 'connected' ? 'Live data connected' : 
                   connectionStatus === 'connecting' ? 'Connecting...' : 'Connection lost'}
                </span>
              </div>
              <button
                onClick={handleRefresh}
                disabled={isRefreshing}
                className="flex items-center space-x-2 bg-blue-700 hover:bg-blue-800 px-4 py-2 rounded-lg transition-colors disabled:opacity-50"
              >
                <RefreshCw className={`w-4 h-4 ${isRefreshing ? 'animate-spin' : ''}`} />
                <span>Refresh</span>
              </button>
            </div>
          </div>
        </div>
      </div>

      <div className="container mx-auto px-4 py-8">
        {/* Error Alert */}
        {error && (
          <div className="bg-red-50 border border-red-200 rounded-lg p-4 mb-6">
            <div className="flex items-center space-x-2">
              <AlertCircle className="w-5 h-5 text-red-600" />
              <div>
                <p className="text-red-800 font-medium">Error</p>
                <p className="text-red-700 text-sm">{error}</p>
              </div>
            </div>
          </div>
        )}

        {/* Summary Cards */}
        {summary && (
          <div className="grid grid-cols-1 md:grid-cols-4 gap-6 mb-8">
            <div className="bg-white rounded-lg shadow-lg p-6">
              <div className="flex items-center space-x-3">
                <div className="w-12 h-12 bg-blue-100 rounded-lg flex items-center justify-center">
                  <DollarSign className="w-6 h-6 text-blue-600" />
                </div>
                <div>
                  <p className="text-sm text-gray-600">Total Value</p>
                  <p className="text-2xl font-bold text-blue-600">
                    ₹{summary.totalValue.toLocaleString('en-IN')}
                  </p>
                </div>
              </div>
            </div>

            <div className="bg-white rounded-lg shadow-lg p-6">
              <div className="flex items-center space-x-3">
                <div className={`w-12 h-12 rounded-lg flex items-center justify-center ${
                  summary.totalGainLoss >= 0 ? 'bg-green-100' : 'bg-red-100'
                }`}>
                  {summary.totalGainLoss >= 0 ? (
                    <TrendingUp className="w-6 h-6 text-green-600" />
                  ) : (
                    <TrendingDown className="w-6 h-6 text-red-600" />
                  )}
                </div>
                <div>
                  <p className="text-sm text-gray-600">Total Gain/Loss</p>
                  <p className={`text-2xl font-bold ${
                    summary.totalGainLoss >= 0 ? 'text-green-600' : 'text-red-600'
                  }`}>
                    {summary.totalGainLoss >= 0 ? '+' : ''}₹{summary.totalGainLoss.toLocaleString('en-IN')}
                  </p>
                </div>
              </div>
            </div>

            <div className="bg-white rounded-lg shadow-lg p-6">
              <div className="flex items-center space-x-3">
                <div className={`w-12 h-12 rounded-lg flex items-center justify-center ${
                  summary.totalGainLossPercent >= 0 ? 'bg-green-100' : 'bg-red-100'
                }`}>
                  <BarChart3 className={`w-6 h-6 ${
                    summary.totalGainLossPercent >= 0 ? 'text-green-600' : 'text-red-600'
                  }`} />
                </div>
                <div>
                  <p className="text-sm text-gray-600">Return %</p>
                  <p className={`text-2xl font-bold ${
                    summary.totalGainLossPercent >= 0 ? 'text-green-600' : 'text-red-600'
                  }`}>
                    {summary.totalGainLossPercent >= 0 ? '+' : ''}{summary.totalGainLossPercent.toFixed(2)}%
                  </p>
                </div>
              </div>
            </div>

            <div className="bg-white rounded-lg shadow-lg p-6">
              <div className="flex items-center space-x-3">
                <div className="w-12 h-12 bg-purple-100 rounded-lg flex items-center justify-center">
                  <Activity className="w-6 h-6 text-purple-600" />
                </div>
                <div>
                  <p className="text-sm text-gray-600">Total Shares</p>
                  <p className="text-2xl font-bold text-purple-600">
                    {summary.totalShares.toLocaleString('en-IN')}
                  </p>
                </div>
              </div>
            </div>
          </div>
        )}

        {/* Quarter Filter */}
        <div className="bg-white rounded-lg shadow-lg p-6 mb-8">
          <div className="flex items-center justify-between">
            <div>
              <h2 className="text-xl font-bold text-gray-800 mb-2">Portfolio Holdings</h2>
              <p className="text-gray-600">AI-recommended stock portfolio performance</p>
            </div>
            
            {availableQuarters.length > 0 && (
              <div className="flex items-center space-x-4">
                <label className="text-sm font-medium text-gray-700">Quarter:</label>
                <select
                  value={selectedQuarter}
                  onChange={(e) => handleQuarterChange(e.target.value)}
                  className="px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                >
                  {availableQuarters.map((quarter) => (
                    <option key={quarter} value={quarter}>
                      {quarter}
                    </option>
                  ))}
                </select>
              </div>
            )}
          </div>
        </div>

        {/* Holdings Table */}
        <div className="bg-white rounded-lg shadow-lg overflow-hidden">
          {holdings.length === 0 ? (
            <div className="p-8 text-center">
              <div className="w-16 h-16 bg-gray-100 rounded-full flex items-center justify-center mx-auto mb-4">
                <BarChart3 className="w-8 h-8 text-gray-400" />
              </div>
              <h3 className="text-lg font-medium text-gray-800 mb-2">No Holdings Found</h3>
              <p className="text-gray-600">
                {selectedQuarter 
                  ? `No portfolio data available for ${selectedQuarter}`
                  : 'No portfolio holdings available'
                }
              </p>
            </div>
          ) : (
            <div className="overflow-x-auto">
              <table className="w-full">
                <thead className="bg-gray-50">
                  <tr>
                    <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                      Stock
                    </th>
                    <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                      Shares
                    </th>
                    <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                      Purchase Price
                    </th>
                    <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                      Current Price
                    </th>
                    <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                      Total Value
                    </th>
                    <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                      Gain/Loss
                    </th>
                    <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                      Return %
                    </th>
                  </tr>
                </thead>
                <tbody className="bg-white divide-y divide-gray-200">
                  {holdings.map((holding) => {
                    const totalValue = holding.shares * holding.current_price;
                    const costBasis = holding.shares * holding.purchase_price;
                    const gainLoss = totalValue - costBasis;
                    const returnPercent = costBasis > 0 ? (gainLoss / costBasis) * 100 : 0;

                    return (
                      <tr key={holding.id} className="hover:bg-gray-50">
                        <td className="px-6 py-4 whitespace-nowrap">
                          <div className="flex items-center space-x-3">
                            <div className="w-10 h-10 rounded-full bg-blue-100 flex items-center justify-center">
                              <span className="text-blue-600 font-semibold text-sm">
                                {holding.stock_symbol.charAt(0)}
                              </span>
                            </div>
                            <div>
                              <div className="text-sm font-medium text-gray-900">{holding.stock_symbol}</div>
                              <div className="text-sm text-gray-500">{holding.company_name}</div>
                            </div>
                          </div>
                        </td>
                        <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                          {holding.shares.toLocaleString('en-IN')}
                        </td>
                        <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                          ₹{holding.purchase_price.toFixed(2)}
                        </td>
                        <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                          ₹{holding.current_price.toFixed(2)}
                        </td>
                        <td className="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                          ₹{totalValue.toLocaleString('en-IN')}
                        </td>
                        <td className="px-6 py-4 whitespace-nowrap">
                          <span className={`text-sm font-medium ${
                            gainLoss >= 0 ? 'text-green-600' : 'text-red-600'
                          }`}>
                            {gainLoss >= 0 ? '+' : ''}₹{gainLoss.toLocaleString('en-IN')}
                          </span>
                        </td>
                        <td className="px-6 py-4 whitespace-nowrap">
                          <div className="flex items-center space-x-2">
                            {returnPercent >= 0 ? (
                              <TrendingUp className="w-4 h-4 text-green-600" />
                            ) : (
                              <TrendingDown className="w-4 h-4 text-red-600" />
                            )}
                            <span className={`text-sm font-medium ${
                              returnPercent >= 0 ? 'text-green-600' : 'text-red-600'
                            }`}>
                              {returnPercent >= 0 ? '+' : ''}{returnPercent.toFixed(2)}%
                            </span>
                          </div>
                        </td>
                      </tr>
                    );
                  })}
                </tbody>
              </table>
            </div>
          )}
        </div>
      </div>

      <Footer />
    </div>
  );
};

export default PortfolioDashboard;