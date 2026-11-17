function monteCarloArea()
    % find the area under f(x) = -x^2 + 4 from x=0 to x=2
    f = @(x) -x.^2 + 4;
    num_points = 10000;
    
    % x goes from 0 to 2, y goes from 0 to 4
    x_rand = 2 * rand(1, num_points);
    y_rand = 4 * rand(1, num_points);

    is_under = y_rand <= f(x_rand);
    box_area = 8;
    est_area = box_area * (sum(is_under) / num_points);
    
    fprintf('Estimated Area: %.4f (True Area is ~5.333)\n', est_area);

    fileID = fopen('mc_result.txt', 'w');
    if fileID ~= -1
        fprintf(fileID, 'Monte Carlo Simulation Results\n');
        fprintf(fileID, 'Number of points: %d\n', num_points);
        fprintf(fileID, 'Estimated Area: %.4f\n', est_area);
        fclose(fileID);
        disp('Results exported to mc_result.txt');
    end
end