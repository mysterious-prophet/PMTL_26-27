function processCSVData()
    % generate a mock CSV file to simulate an external sensor log
    mock_data = [ (1:20)', (20 + 5*randn(20, 1)), (50 + 10*randn(20, 1))];

    % write double array into a .csv file
    writematrix(mock_data, 'mock_sensor.csv');
    disp('mock_sensor.csv created.');

    % read into array
    sensor_data = readmatrix('mock_sensor.csv');

    temp = sensor_data(:, 2);
    humidity = sensor_data(:, 3);

    mean_temp = mean(temp);
    mean_hum = mean(humidity);

    summary_stats = [mean_temp, mean_hum];

    writematrix(summary_stats, 'sensor_summary.csv');
    fprintf('Summary saved. Mean Temp: %.2f, Mean Humidity: %.2f\n', mean_temp, mean_hum);
end