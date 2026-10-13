function collatzConjecture(max_start)
    if nargin < 1
        max_start = 1000;
    end

    steps_record = zeros(1, max_start);

    figure; 
    hold on; 
    grid on;
    title('Collatz Conjecture Steps');
    xlabel('Starting Number');
    ylabel('Steps to reach 1');

    % calc. steps needed to reach 1 acc. to collatz conj. defs.
    for i = 1:max_start
        n = i;
        steps = 0;
        
        while n > 1
            if mod(n, 2) == 0
                n = n / 2;
            else
                n = 3 * n + 1;
            end
            steps = steps + 1;
        end

        steps_record(i) = steps;
    end
    
    [max_steps, best_start] = max(steps_record);
    fprintf('Longest sequence under %d starts at %d (took %d steps).\n', max_start, best_start, max_steps);
   
    bar(1:max_start, steps_record, 'FaceColor', [0.2 0.6 0.8]);
    plot(best_start, max_steps, 'r*', 'MarkerSize', 10); 
    hold off;
end