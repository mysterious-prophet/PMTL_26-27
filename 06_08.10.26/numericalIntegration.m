function approx_area = numericalIntegration(n_steps)
    if nargin < 1
        n_steps = 100; 
    end

    % anonymous function for a Gaussian curve
    f = @(x) exp(-x.^2);
    
    a = 0;
    b = 2;
    
    % built-in integral function
    exact_area = integral(f, a, b);
    fprintf('Exact Area (built-in): %.6f\n', exact_area);
    
    % plotting the function area
    x_plot = linspace(a, b, 100);
    figure;
    area(x_plot, f(x_plot), 'FaceColor', [0.8 0.9 1]);
    title('Area under f(x) = exp(-x^2)');
    xlabel('x');
    ylabel('f(x)');
    hold on;

    % num. approximation
    dx = (b - a) / n_steps;
    % Riemann sum
    x_rect = a:dx:(b-dx);

    approx_area = sum(f(x_rect) * dx);
    
    abs_error = abs(exact_area - approx_area);
    fprintf('Approximate Area (%d steps): %.6f\n', n_steps, approx_area);
    fprintf('Absolute Error: %.6f\n', abs_error);
end