function [t, y] = eulerODE(dt)
    if nargin < 1
        dt = 0.5;
    end

    % ODE: dy/dt = -0.3 * y
    % init. cond.: y(0) = 100
    decay_rate = -0.3;
    t_end = 10;
    
    % time vector
    t = 0:dt:t_end;
    n_points = length(t);
    
    % analytical solution for comparison
    y_exact = 100 * exp(decay_rate * t);
    
    figure;
    hold on;
    grid on;
    plot(t, y_exact, 'k-', 'LineWidth', 2, 'DisplayName', 'Exact Solution');
    xlabel('Time');
    ylabel('Quantity y(t)');
    title(sprintf('ODE Euler Approximation (Step Size: %.1f)', dt));

    % Euler method solution
    y = zeros(1, n_points);
    y(1) = 100;
    for i = 1:(n_points - 1)
        y(i+1) = y(i) + dt * (decay_rate * y(i));
    end
    
    plot(t, y, 'ro', 'DisplayName', 'Euler Method');
    legend('show');
    hold off;
end