function x = bubbleSort(n)
    % default array of ints. {1, ..., n}
    if nargin < 1
        n = 100;
    end
    x = randperm(n); 
    
    % setup visualization
    figure;
    hBar = bar(x, 'FaceColor', [0.2 0.6 0.8]);
    title('Bubble Sort Visualization');
    xlabel('Index');
    ylabel('Value');
    
    if n == 1
        return;
    end

    for i = 1:n
        pause(0.1)
        flag = 0;
        for j = 1:(n - i)
            if x(j) > x(j+1)
                temp = x(j);
                x(j) = x(j+1);
                x(j+1) = temp;
                flag = 1;
                
                % visualization update
                hBar.YData = x;
                drawnow; 
            end
        end
        
        % termination condition
        if flag == 0
            break;
        end
    end
    
    disp('Sorting complete!');
end