function x_min = gradientDescent(learning_rate, max_iter)
    if nargin < 2
        learning_rate = 0.1;
        max_iter = 60;
    end

    % f(x) = x^2 + 2x + 1  (min. at x = -1)
    f = @(x) x.^2 + 2*x + 1;
    
    % df/dx = 2x + 2
    df = @(x) 2*x + 2;
    
    % start the search at x = 3.5
    current_x = 3.5;
    
   
    x_plot = linspace(-4, 4, 100);
    figure; 
    hold on;
    grid on;
    plot(x_plot, f(x_plot), 'k-', 'LineWidth', 1.5);
    title(sprintf('Gradient Descent (LR: %.2f)', learning_rate));
    
    for i = 1:max_iter
        plot(current_x, f(current_x), 'r.', 'MarkerSize', 15);
        % animate with a small pause
        drawnow;
        pause(0.1);
        
        grad = df(current_x);
        current_x = current_x - (learning_rate * grad);
    end
    
    x_min = current_x;
    plot(x_min, f(x_min), 'go', 'MarkerSize', 10, 'MarkerFaceColor', 'g');
    fprintf('Optimization finished. Minimum found at x = %.4f\n', x_min);
    hold off;
end