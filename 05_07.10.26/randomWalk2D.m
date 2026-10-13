function final_distance = randomWalk2D(n_steps)
    if nargin < 1
        n_steps = 1000;
    end

    % preallocate coordinate arrays
    x = zeros(1, n_steps);
    y = zeros(1, n_steps);
    
    figure; 
    hold on;
    axis equal;
    grid on;
    title(sprintf('2D Random Walk (%d steps)', n_steps));
    xlabel('X coordinate');
    ylabel('Y coordinate');
    
    % mark the starting point
    plot(0, 0, 'ko', 'MarkerSize', 8, 'MarkerFaceColor', 'k');

    % do the random walk in 4 directions
    for i = 2:n_steps
        r = rand();
        if r < 0.25
            x(i) = x(i-1);
            y(i) = y(i-1) + 1;
        elseif r < 0.50
            x(i) = x(i-1);
            y(i) = y(i-1) - 1;
        elseif r < 0.75
            x(i) = x(i-1) + 1;
            y(i) = y(i-1);
        else
            x(i) = x(i-1) - 1;
            y(i) = y(i-1);
        end
    end
    
    % plot the last point
    plot(x, y, 'b-', 'LineWidth', 1);
    plot(x(end), y(end), 'r*', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
    
    % calculate distance from the origin
    final_distance = sqrt(x(end)^2 + y(end)^2);
    fprintf('Final distance from origin: %.2f units\n', final_distance);
    hold off;
end