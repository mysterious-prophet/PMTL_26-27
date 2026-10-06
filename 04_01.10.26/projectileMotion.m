function projectileMotion(v0, angle_deg)
    if nargin < 2
        v0 = 25;
        angle_deg = 45;
    end

    % gravity
    g = 9.81;
    
    % convert angle to radians for MATLAB's standard trig functions
    theta = angle_deg * (pi / 180); 
    
    % total flight time
    t_flight = (2 * v0 * sin(theta)) / g;
    
    % time vector from 0 to t_flight with 100 steps
    t = linspace(0, t_flight, 100);

    % x, y coordinates over time
    x = v0 * cos(theta) * t;
    y = v0 * sin(theta) * t - 0.5 * g * (t.^2);
    
    figure;
    plot(x, y, 'b--', 'LineWidth', 2);
    % use formatted string in the title using sprintf
    title(sprintf('Projectile Trajectory (v0 = %d m/s, angle = %d°)', v0, angle_deg));
    xlabel('Distance (m)');
    ylabel('Height (m)');
    grid on;
    axis equal;
    ylim([0, max(y) + 5]);
end