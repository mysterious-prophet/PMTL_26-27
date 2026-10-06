function populationGrowth()
    initial_bacteria = 100;
    capacity = 100000;
    growth_rate = 1.07;
    
    current_pop = initial_bacteria;
    hours_passed = 0;
    
    pop_history = current_pop;
    time_history = hours_passed;

    disp('Simulation starting...');

    while current_pop < capacity
        current_pop = current_pop * growth_rate;
        
        hours_passed = hours_passed + 1;
        
        % append to arrays, matlab shows warning that arrays change size
        % each iteration
        pop_history = [pop_history, current_pop];
        time_history = [time_history, hours_passed];
    end
    
    fprintf('It took %d hours to reach the capacity of %d bacteria.\n', hours_passed, capacity);
    
    figure;
    plot(time_history, pop_history, 'ro-', 'LineWidth', 1.5, 'MarkerFaceColor', 'r');
    title('Bacterial Population Growth');
    xlabel('Hours');
    ylabel('Population');
    yline(capacity, 'k--', 'Capacity Limit');
    grid on;
end