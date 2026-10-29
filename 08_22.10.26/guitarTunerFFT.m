function guitarTunerFFT()
    % std. cd sample rate, 1 second, gen. noisy low E tone
    Fs = 44100;
    t = 0:1/Fs:1;
    f_true = 82.41;
    y = 0.8 * sin(2*pi*f_true*t) + 0.2 * randn(1, length(t));
    
    % export audio file
    audiowrite('low_e_string.wav', y, Fs);

    % read audio file
    [y_in, fs_in] = audioread('low_e_string.wav');

    % FFT of signal
    Y = fft(y_in);
    mag_Y = abs(Y);

    % find largers magnitude in signal
    half_length = floor(length(Y)/2);
    mag_half = mag_Y(1:half_length);
    [~, max_idx] = max(mag_Y);

    % calculate the frequency 
    detected_freq = (max_idx - 1) * (fs_in / length(y_in));
    fprintf('Detected String Frequency: %.2f Hz\n', detected_freq);
end