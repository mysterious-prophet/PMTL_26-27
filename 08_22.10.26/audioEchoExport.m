function audioEchoExport()
    % load matlab's built-in audio sample 
    % y is the audio vector, Fs is sample rate
    load handel.mat;
    
    % take only the first 3 seconds
    y = y(1:3*Fs);
    
    % play original audio, wait to finish
    disp('Playing original audio...');
    sound(y, Fs);
    pause(3.5);

    % create echo
    delay_samples = round(0.5 * Fs);
    echo_sig = zeros(length(y), 1);
    echo_sig(delay_samples+1 : end) = y(1 : end-delay_samples);

    final_audio = y + 0.5 * echo_sig;

    % normalize to prevent clipping when saving
    final_audio = final_audio / max(abs(final_audio));

    % save audio file
    audiowrite('handel_echo.wav', final_audio, Fs);
    disp('Saved handel_echo.wav. Playing result...');
    sound(final_audio, Fs);
end