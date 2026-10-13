function coeffs = sensorFitting(poly_degree)
    if nargin < 1
        poly_degree = 2;
    end

    % noisy sensor data (underlying trend is a parabola)
    x_data = 0:0.5:10;
    true_signal = 0.5 * x_data.^2 - 2 * x_data + 5;
    
    % random noise
    noise = 5 * randn(1, length(x_data));
    y_noisy = true_signal + noise;
    
    figure;
    hold on;
    scatter(x_data, y_noisy, 50, 'k', 'filled', 'DisplayName', 'Raw Sensor Data');
    title(sprintf('Polynomial Data Fitting (Degree %d)', poly_degree));
    xlabel('Time (s)'); ylabel('Sensor Reading');
    grid on;

    % poly fit
    coeffs = polyfit(x_data, y_noisy, poly_degree);
    y_fitted = polyval(coeffs, x_data);
    
    plot(x_data, y_fitted, 'b-', 'LineWidth', 2, 'DisplayName', 'Fitted Curve');
    legend('show', 'Location', 'best');
    hold off;
    
    % fitted equation coefficients
    disp('Calculated Polynomial Coefficients:');
    disp(coeffs);

    % R2 coeff.
    SSE = sum((y_noisy - y_fitted).^2);
    SST = sum((y_noisy - mean(y_fitted)).^2);
    R2 = 1 - (SSE/SST);

    fprintf("R2 val.: %.4f\n", R2)
end