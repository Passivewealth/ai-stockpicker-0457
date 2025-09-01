import React, { useState } from 'react';
import { Search, Menu, X } from 'lucide-react';
import { Link } from 'react-router-dom';

const Header = () => {
  const [isMenuOpen, setIsMenuOpen] = useState(false);

  return (
    <header className="bg-blue-600 text-white shadow-lg">
      <div className="container mx-auto px-4">
        <div className="flex items-center justify-between h-16">
          {/* Logo */}
          <Link to="/" className="flex items-center space-x-2 hover:opacity-80 transition-opacity">
            <div className="w-8 h-8 bg-white rounded flex items-center justify-center">
              <span className="text-blue-600 font-bold text-sm">PW</span>
            </div>
            <span className="text-xl font-bold">Passive Wealth</span>
          </Link>

          {/* Desktop Navigation */}
          <nav className="hidden md:flex items-center space-x-8">
            <Link to="/" className="hover:text-blue-200 transition-colors">Top Stocks</Link>
            <Link to="/portfolio" className="hover:text-blue-200 transition-colors">Portfolio</Link>
            <a href="#" className="hover:text-blue-200 transition-colors">Pricing</a>
            <a href="#" className="hover:text-blue-200 transition-colors">Market</a>
            <Link to="/backtest" className="hover:text-blue-200 transition-colors">Backtest</Link>
          </nav>

          {/* Search Bar */}
          <div className="hidden lg:flex items-center bg-white rounded-lg px-3 py-2 w-64">
            <Search className="w-4 h-4 text-gray-400 mr-2" />
            <input
              type="text"
              placeholder="Search stocks..."
              className="flex-1 text-gray-800 text-sm outline-none"
            />
          </div>

          {/* Mobile Menu Button */}
          <button
            className="md:hidden"
            onClick={() => setIsMenuOpen(!isMenuOpen)}
          >
            {isMenuOpen ? <X className="w-6 h-6" /> : <Menu className="w-6 h-6" />}
          </button>
        </div>

        {/* Mobile Menu */}
        {isMenuOpen && (
          <div className="md:hidden py-4 border-t border-blue-500">
            <nav className="flex flex-col space-y-4">
              <Link to="/" className="hover:text-blue-200 transition-colors">Top Stocks</Link>
              <Link to="/portfolio" className="hover:text-blue-200 transition-colors">Portfolio</Link>
              <a href="#" className="hover:text-blue-200 transition-colors">Pricing</a>
              <a href="#" className="hover:text-blue-200 transition-colors">Market</a>
              <Link to="/backtest" className="hover:text-blue-200 transition-colors">Backtest</Link>
              <div className="flex items-center bg-white rounded-lg px-3 py-2 mt-4">
                <Search className="w-4 h-4 text-gray-400 mr-2" />
                <input
                  type="text"
                  placeholder="Search stocks..."
                  className="flex-1 text-gray-800 text-sm outline-none"
                />
              </div>
            </nav>
          </div>
        )}
      </div>
    </header>
  );
};

export default Header;