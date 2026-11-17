function metropolisHastings()
    % target pdf - ring shape
    % points closer to a radius of 5 have a higher probability
    target_pdf = @(x, y) exp(-0.5 * (sqrt(x.^2 + y.^2) - 5).^2);
    
    num_samples = 10000;
    % std of the random walk
    step_size = 1.5;
    chain = zeros(num_samples, 2);
    chain(1, :) = [0, 0];
    
    for i = 2:num_samples
        curr_x = chain(i-1, 1);
        curr_y = chain(i-1, 2);
        
        prop_x = curr_x + randn() * step_size;
        prop_y = curr_y + randn() * step_size;
        
        prob_curr = target_pdf(curr_x, curr_y);
        prob_prop = target_pdf(prop_x, prop_y);
        
        if prob_curr == 0
            alpha = 1; 
        else
            alpha = prob_prop / prob_curr;
        end
        
        if rand() < alpha
            % accept
            chain(i, :) = [prop_x, prop_y];
        else
            % reject (stay in place)
            chain(i, :) = [curr_x, curr_y];
        end
    end
    
    % calc. mean
    mean_pos = mean(chain);
    
    fileID = fopen('mcmc_summary.txt', 'w');
    if fileID ~= -1
        fprintf(fileID, 'Metropolis-Hastings MCMC Sampling\n');
        fprintf(fileID, 'Total samples generated: %d\n', num_samples);
        fprintf(fileID, 'Mean X: %.3f\n', mean_pos(1));
        fprintf(fileID, 'Mean Y: %.3f\n', mean_pos(2));
        fclose(fileID);
        disp('Summary written to mcmc_summary.txt');
    end
    
    figure;
    % discard the first 1000 samples for a cleaner plot
    burn_in = 1000;
    scatter(chain(burn_in:end, 1), chain(burn_in:end, 2), 10, 'b', 'filled', 'MarkerFaceAlpha', 0.2);
    axis equal;
    grid on;
    title('MCMC Samples (Target: Ring Distribution)');
    xlabel('X');
    ylabel('Y');
end