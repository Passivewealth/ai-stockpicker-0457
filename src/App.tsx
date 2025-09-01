import React from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import ErrorBoundary from './components/ErrorBoundary';
import HomePage from './pages/HomePage';
import PortfolioDashboard from './pages/PortfolioDashboard';
import BacktestHistory from './pages/BacktestHistory';

function App() {
  return (
    <ErrorBoundary>
      <Router>
        <Routes>
          <Route path="/" element={<HomePage />} />
          <Route path="/backtest" element={<BacktestHistory />} />
          <Route path="/portfolio" element={<PortfolioDashboard />} />
          <Route path="/momentum" element={<PortfolioDashboard />} />
        </Routes>
      </Router>
    </ErrorBoundary>
  );
}

export default App;