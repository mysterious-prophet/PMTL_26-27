function buffonNeedle(num_needles)
    if nargin < 1
        num_needles = 10000;
    end

    % floor distance and needle length parameters
    L = 1;
    D = 1;
    
    % draw the floor lines
    figure; hold on;
    for line_y = 0:3
        yline(line_y, 'k-', 'LineWidth', 2);
    end
    axis equal;
    xlim([0 3]);
    ylim([-0.5 3.5]);
    title('Buffon''s Needle Simulation');
    
    disp('Floor prepped. Waiting for Monte Carlo needle drops...');

    y_center = 3 * rand(1, num_needles);
    
    theta = (pi / 2) * rand(1, num_needles);
    dy = (L / 2) * sin(theta);
    
    dist_to_line = abs(y_center - round(y_center));
    crosses = dist_to_line <= dy;
    
    P = sum(crosses) / num_needles;
    
    % P = (2*L) / (pi*D)  =>  pi = (2*L) / (P*D)
    pi_est = (2 * L) / (P * D);
    fprintf('Estimated value of Pi from %d needles: %f\n', num_needles, pi_est);
    
    % plotting of the first 100 needles to keep the graph clean
    plot_limit = min(num_needles, 100);
    x_center = 3 * rand(1, plot_limit);
    
    for i = 1:plot_limit
        dx = (L / 2) * cos(theta(i));
        % red if it crossed, blue if it missed
        if crosses(i)
            plot([x_center(i)-dx, x_center(i)+dx], [y_center(i)-dy(i), y_center(i)+dy(i)], 'r-', 'LineWidth', 1.5);
        else
            plot([x_center(i)-dx, x_center(i)+dx], [y_center(i)-dy(i), y_center(i)+dy(i)], 'b-', 'LineWidth', 1.5);
        end
    end
end