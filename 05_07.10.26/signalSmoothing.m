function smoothed = signalSmoothing(window_size)
    if nargin < 1
        window_size = 5;
    end
    
    % create a noisy signal from a sinusoid
    t = linspace(0, 10, 150);
    clean_sig = sin(t);
    noisy_sig = clean_sig + 0.4 * randn(1, length(t));
    
    N = length(noisy_sig);
    half_win = floor(window_size / 2);
    
    % plot the noisy signal
    figure; 
    hold on; 
    grid on;
    plot(t, noisy_sig, 'Color', [0.8 0.8 0.8], 'DisplayName', 'Noisy Signal');

    % prealoccate the smoothed array
    smoothed = zeros(1, N);
    smoothed(1:half_win) = noisy_sig(1:half_win);
    smoothed((N - half_win + 1):N) = noisy_sig((N - half_win + 1):N);
    
    for i = (1 + half_win) : (N - half_win)
        chunk = noisy_sig( (i - half_win) : (i + half_win) );
        smoothed(i) = mean(chunk);
    end
    
    % plot smoothed signal
    plot(t, smoothed, 'b-', 'LineWidth', 2, 'DisplayName', sprintf('Smoothed (win. size: %d)', window_size));
    legend('show');
    title('Moving Average Filter');
    xlabel('Time');
    ylabel('Amplitude');
end