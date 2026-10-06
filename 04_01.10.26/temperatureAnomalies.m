function temperatureAnomalies()
    days = 1:31;
    temps = 24 + 4 * randn(1, 31);
    
    heatwave_threshold = 28.0;
    
    figure; 
    hold on;
    plot(days, temps, 'k-', 'LineWidth', 1.5);
    yline(heatwave_threshold, 'r--', 'Heatwave Threshold');
    title('August Daily Temperatures');
    xlabel('Day of Month');
    ylabel('Temperature (°C)');


    is_hot = temps > heatwave_threshold;
    hot_days = days(is_hot);
    hot_temps = temps(is_hot);
    
    plot(hot_days, hot_temps, 'r*', 'MarkerSize', 10);
    hold off;
    
    if isempty(hot_temps)
        disp('No heatwave days recorded.');
    else
        avg_hot = mean(hot_temps);
        fprintf('Average temperature during heatwave days: %.1f°C\n', avg_hot);
    end
end