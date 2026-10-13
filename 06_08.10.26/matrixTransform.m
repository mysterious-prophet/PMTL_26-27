function rotated_pts = matrixTransform(theta_deg)
    if nargin < 1
        theta_deg = 45;
    end

    % define a 2D square as a 2x5 matrix (X coords in row 1, Y in row 2)
    % last point repeats the first to close the shape
    square_pts = [0, 2, 2, 0, 0; 
                  0, 0, 2, 2, 0];
              
    figure;
    hold on;
    axis equal;
    grid on;

    % plot original 
    plot(square_pts(1,:), square_pts(2,:), 'k--', 'LineWidth', 1.5);
    xlim([-3 3]);
    ylim([-3 3]);
    title(sprintf('Shape Rotation by %d Degrees', theta_deg));

    % rotate and plot
    R = [cosd(theta_deg), -sind(theta_deg); 
         sind(theta_deg),  cosd(theta_deg)];
    rotated_pts = R * square_pts;
    
    plot(rotated_pts(1,:), rotated_pts(2,:), 'b-', 'LineWidth', 2);
    legend('Original', 'Rotated');
    hold off;
end