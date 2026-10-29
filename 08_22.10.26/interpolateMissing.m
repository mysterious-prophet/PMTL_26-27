function interpolateMissing()
    % time and a sine wave
    t = 0:0.5:10;
    y = sin(t);
    
    % sensor failure by inserting NaNs
    y(5) = NaN;
    y(12:14) = NaN;
    
    figure;
    hold on;
    plot(t, y, 'ko-', 'MarkerFaceColor', 'k', 'DisplayName', 'Corrupted Data');

    is_missing = isnan(y);
    valid_t = t(~is_missing);
    valid_y = y(~is_missing);

    % interpolate missing data, linear, cubic, spline...
    y_fixed = interp1(valid_t, valid_y, t, 'spline');

    plot(t, y_fixed, 'r--', 'LineWidth', 2, 'DisplayName', 'Interpolated');
    legend('show');
    title('Interpolating Missing Sensor Data');
end