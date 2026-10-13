function complexPhasor(f1)
    if nargin < 1
        f1 = 440;
    end

    % first frequency
    omega1 = 2 * pi * f1;
    t = 0:0.0001:0.05;
    z1 = exp(1i * omega1 * t);

    figure;
    subplot(2, 1, 1);
    plot(t, real(z1), 'b-', t, imag(z1), 'r--');
    title(sprintf('Phasor Components (%d Hz)', f1));
    xlabel('Time (s)'); ylabel('Amplitude');
    legend('Real', 'Imaginary');

    % second frequency
    f2 = 329.6;
    omega2 = 2 * pi * f2;
    z2 = exp(1i * omega2 * t);

    % chord interference
    z_chord = z1 + z2;

    subplot(2, 1, 2);
    plot(t, real(z_chord), 'g-', 'LineWidth', 1.5);
    title('Chord Interference');
    xlabel('Time (s)');
    ylabel('Amplitude');
    grid on;
end