% demonstrating function recursion as an alternative to loops
function fac = factorialRecursive(n)
    % input validation (identical to the iterative version)
    if (n >= 0 && round(n) == n)
        % base case
        if (n == 0 || n == 1)
            fac = 1;
        % recursive step - function calls itself
        else
            fac = n * factorialRecursive(n - 1);
        end
    else
        disp('Error: Invalid input!');
        fac = {};
    end
end