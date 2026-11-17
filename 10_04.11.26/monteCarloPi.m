function [pi_est, x, y, circle_inside] = monteCarloPi(num_points)
    if nargin < 1
        num_points = 10000;
    end
    
    fprintf('Running Monte Carlo Pi Estimation with %d points...\n', num_points);
    
    figure;
    hold on;
    axis square;
    title('Monte Carlo Simulation for Estimating Pi');
    xlabel('x');
    ylabel('y');
    
    % true quarter circle edge
    theta = linspace(0, pi/2, 100);
    plot(cos(theta), sin(theta), 'k-', 'LineWidth', 2, 'DisplayName', 'True Boundary');
    
    x = rand(1, num_points);
    y = rand(1, num_points);

    dists = sqrt(x.^2 + y.^2);
    circle_inside = dists <= 1;
    
    pi_est = 4 * sum(circle_inside) / num_points;
    fprintf('Estimated value of Pi: %f \n', pi_est);
    
    plot(x(circle_inside), y(circle_inside), 'b.', 'DisplayName', 'Inside Circle');
    plot(x(~circle_inside), y(~circle_inside), 'r.', 'DisplayName', 'Outside Circle');
    
    legend('show', 'Location', 'southwest');
    hold off;
end