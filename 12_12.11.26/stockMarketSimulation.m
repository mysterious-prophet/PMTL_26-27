function stockMarketSimulation()
    % init. stock price, annual drift, annual volatility
    S0 = 200;
    mu = 0.075;
    sigma = 0.25;
    
    % annual trading days, step
    days = 260;
    dt = 1 / days;
    num_sims = 100;
    
   % init price history
    prices = zeros(days, num_sims);
    prices(1, :) = S0;
    
    for s = 1:num_sims
        for t = 2:days
            % calculate next price using SPDE
            prices(t, s) = prices(t-1, s) * (1 + mu * dt + sigma * sqrt(dt) * randn());
        end
    end
    
    figure;
    hold on;
    grid on;
    % slightly transparent lines
    plot(prices, 'Color', [0, 0.4, 0.8, 0.2]);
    
    % overlay average
    plot(mean(prices, 2), 'r-', 'LineWidth', 3);
    
    title('Monte Carlo Stock Price Simulation');
    xlabel('Trading Days');
    ylabel('Price (USD)');
    
    writematrix(prices, 'simulated_stocks.csv');
    disp('Saved 100 simulated trajectories to simulated_stocks.csv');
end