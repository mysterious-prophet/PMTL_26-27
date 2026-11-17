function mandelbrotFractal(grid_size, max_iter)
    if nargin < 1
        % resolution, max iters. per pixel
        grid_size = 400;
        max_iter = 50;
    end

    % bounds of the complex plane to view
    x_min = -2.0; x_max = 0.5;
    y_min = -1.2; y_max = 1.2;
    
    % coordinate vectors
    x_vals = linspace(x_min, x_max, grid_size);
    y_vals = linspace(y_min, y_max, grid_size);
    
    % output image matrix
    fractal_img = zeros(grid_size, grid_size);
    
    for r = 1:grid_size
        for c = 1:grid_size
            
            % complex const.
            C = x_vals(c) + 1i * y_vals(r);
            
            % init complex num
            Z = 0;
            iter = 0;
            
            % how many iters. does it take to diverge?
            while abs(Z) <= 2 && iter < max_iter
                Z = Z^2 + C;
                iter = iter + 1;
            end
            
            % plot the number of iterations before divergence
            fractal_img(r, c) = iter;
        end
    end
    
    % visualize the fractal
    figure;
    imagesc(x_vals, y_vals, fractal_img);
    colormap('hot');
    axis xy;
    axis square;
    title('Mandelbrot Set');
    xlabel('Real Part');
    ylabel('Imaginary Part');
end