function root_val = rootFinder(tol)
    if nargin < 1
        tol = 1e-4;
    end

    % f(x) = x^3 - 2x - 5
    f = @(x) x.^3 - 2*x - 5;
   
    % initial bracket [a, b] where the root is known to exist
    a = 2; 
    b = 3;
    
    % ensure the function changes sign across the interval
    if sign(f(a)) == sign(f(b))
        disp('Error: Root is not bracketed.');
        root_val = NaN;
        return;
    end

    while (b - a) > tol
        c = (a + b) / 2;
        
        if sign(f(a)) == sign(f(c))
            a = c;
        else
            b = c;
        end
    end

    root_val = (a + b) / 2;
    fprintf('Root found at x = %.5f (Tol.: %g)\n', root_val, tol);
end