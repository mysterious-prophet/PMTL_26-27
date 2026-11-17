function travelingSalesperson()
    % 30 random city coordinates and save to a CSV as a dataset
    num_cities = 30;
    cities = rand(num_cities, 2) * 100;
    writematrix(cities, 'city_coordinates.csv');
    
    % anonymous function to calculate total route distance
    calc_dist = @(pts) sum(sqrt(sum(diff(pts).^2, 2)));

    city_locs = readmatrix('city_coordinates.csv');
    best_route = [1:num_cities, 1];
    best_dist = calc_dist(city_locs(best_route, :));

    fprintf('Initial distance: %.2f\n', best_dist);
    
    % randomly swap two cities and try to find a better route
    for iter = 1:5000
        % don't swap the start
        idx = randi([2, num_cities], 1, 2);
        
        test_route = best_route;

        temp = test_route(idx(1));
        test_route(idx(1)) = test_route(idx(2));
        test_route(idx(2)) = temp;
        
        test_dist = calc_dist(city_locs(test_route, :));
        if test_dist < best_dist
            best_route = test_route;
            best_dist = test_dist;
        end
    end
    
    % save results and output the best found route length
    writematrix(best_route, 'best_route.csv');
    fprintf('Optimized distance: %.2f\n', best_dist);
    
    figure;
    hold on;
    plot(city_locs(best_route, 1), city_locs(best_route, 2), 'b-o', 'LineWidth', 1.5, 'MarkerFaceColor', 'r');
    % start point
    plot(city_locs(1, 1), city_locs(1, 2), 'ks', 'MarkerSize', 10, 'MarkerFaceColor', 'g');
    title('Stochastic TSP Route');
    grid on;
end