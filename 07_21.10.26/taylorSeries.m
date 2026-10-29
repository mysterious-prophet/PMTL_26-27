function taylorSeries()
    syms x;

    % true function
    f_true = sin(x);

    % 3rd order Taylor polynomial expansion around x = 0
    T3 = taylor(f_true, x, 'Order', 4);

    disp('3rd Order Taylor Expansion:');
    disp(T3);

    figure;
    hold on;
    fplot(f_true, [-pi, pi], 'k-', 'LineWidth', 2);
    fplot(T3, [-pi, pi], 'b--', 'LineWidth', 1.5);
    ylim([-2 2]);

    % 5th and 7th order polynomials
    T5 = taylor(f_true, x, 'Order', 6);
    T7 = taylor(f_true, x, 'Order', 8);

    % plot of the symbolic polynomials
    fplot(T5, [-pi, pi], 'r-.', 'LineWidth', 1.5);
    fplot(T7, [-pi, pi], 'g:', 'LineWidth', 2);
    legend('sin(x)', '3rd Order', '5th Order', '7th Order', 'Location', 'best');

    title('Taylor Series Convergence of sin(x)');
    xlabel('x');
    ylabel('f(x)');
end