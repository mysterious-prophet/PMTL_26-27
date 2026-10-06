function piApproximation(n_terms)
    if nargin < 1
        n_terms = 1000;
    end

    leibniz_sum = 0;
    
    % another way to use disp with some variables
    disp(['Calculating Pi using ', num2str(n_terms), ' terms...']);

    for k = 0:(n_terms - 1)
        leibniz_sum = leibniz_sum + ((-1)^k) / (2*k + 1);
    end
    
    my_pi = 4 * leibniz_sum;
    
    fprintf('Approximated Pi: %.6f\n', my_pi);
    fprintf('Built-in Pi: %.6f\n', pi);
    fprintf('Difference: %.6f\n', abs(pi - my_pi));
end