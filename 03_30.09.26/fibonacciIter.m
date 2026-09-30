function result = fibonacciIter(n)
    % handle edge cases and initial sequence conditions
    if n <= 0
        result = [];
    elseif n == 1
        result = 0;
    elseif n == 2
        result = [0 1];
    else
        % preallocate the array with zeros for performance
        result = zeros(1, n);
        result(2) = 1;
        
        for i = 3:n
            result(i) = result(i-1) + result(i-2);
        end
    end
end