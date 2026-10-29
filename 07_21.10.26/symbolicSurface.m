function symbolicSurface()
    syms x y

    % define the surface equation
    Z_sym = x * exp(-x^2 - y^2);

    % calculate the first partial derivative wrt x
    dZ_dx = diff(Z_sym, x);

    % plot the original surface
    figure;
    subplot(1, 2, 1);
    % plot of a symbolic surface within bounds
    fsurf(Z_sym, [-2 2 -2 2]);
    title('Original Surface Z(x,y)');
    xlabel('x');
    ylabel('y');
    zlabel('Z');

    disp('First partial derivative w.r.t x:');
    disp(dZ_dx);

    disp('Waiting for gradient and evaluation logic...');

    dZ_dy = diff(Z_sym, y);
    grad_Z = [dZ_dx; dZ_dy];

    % substitute [0, 0] into symbolic gradient
    grad_eval = double(subs(grad_Z, [x, y], [0, 0]));
    fprintf('Gradient at (0,0): [%.2f, %.2f]\n', grad_eval(1), grad_eval(2));

    subplot(1, 2, 2);
    fsurf(dZ_dy, [-2 2 -2 2]);
    title('Partial Derivative dZ/dy');
    xlabel('x');
    ylabel('y');
    zlabel('Z');
end