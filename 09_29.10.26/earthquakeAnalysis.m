function earthquakeAnalysis()
    % mock earthquake catalog and save it as .csv
    % latitude, longitude, magnitude, depth (km)
    lats = 30 + 10 * rand(50, 1);
    lons = -120 + 20 * rand(50, 1);
    % magnitudes from 2 to 7, depths from 5 to 55 km
    mags = 2 + 5 * rand(50, 1);
    depths = 5 + 50 * rand(50, 1);
    
    % create a table and write to .csv
    seismic_catalog = table(lats, lons, mags, depths, ...
        'VariableNames', {'Lat', 'Lon', 'Magnitude', 'Depth'});
    writetable(seismic_catalog, 'seismic_data.csv');
    disp('Generated seismic_data.csv. Waiting for data analysis...');

    % read table
    quake_data = readtable('seismic_data.csv');

    % access magnitudes
    magnitudes = quake_data.Magnitude;

    % filter severe earthquakes
    is_severe = magnitudes >= 5.0;
    severe_quakes = quake_data(is_severe, :);

    % plot severe earthquakes
    figure;
    hold on;
    grid on;
    plot(severe_quakes.Lon, severe_quakes.Lat, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
    title('Severe Earthquakes (Magnitude >= 5.0)');
    xlabel('Longitude');
    ylabel('Latitude');
end