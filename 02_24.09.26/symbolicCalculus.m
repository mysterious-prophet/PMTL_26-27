% expanding on the syms keyword to perform calculus and algebra
function [] = symbolicCalculus()
    syms x y a b c;

    %% differentiation and integration
    f = sin(x) * exp(x);
    
    % first and second derivatives
    df = diff(f, x);
    d2f = diff(f, x, 2);
    
    % indefinite and definite integrals
    int_f = int(f, x);
    int_def = int(f, x, 0, pi);
    
    disp('Function:'); disp(f);
    disp('Derivative:'); disp(df);
    disp('Definite Integral over [0, pi]:'); disp(int_def);

    %% solving equations symbolically
    % finding roots of a quadratic equation
    eqn = a*x^2 + b*x + c == 0;
    roots = solve(eqn, x);
    
    disp('Roots of quadratic equation:');
    disp(roots);
end