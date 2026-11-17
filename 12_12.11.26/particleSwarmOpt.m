function particleSwarmOpt()
    % minimize Rastrigin function (many local minima)
    % global minimum is exactly at (0, 0)
    rastrigin = @(x, y) 20 + x.^2 + y.^2 - 10*cos(2*pi*x) - 10*cos(2*pi*y);
    
    % PSO params.
    num_particles = 50;
    max_iters = 100;
    % inertia, cognitive coeff., social coeff.
    w = 0.7;
    c1 = 1.5;
    c2 = 1.5;
    
    % visualization
    [X, Y] = meshgrid(linspace(-5, 5, 100));
    figure;
    hold on;
    contourf(X, Y, rastrigin(X,Y), 30, 'LineColor', 'none');
    colormap('parula');
    colorbar;
    title('Particle Swarm Optimization (Rastrigin Function)');
    
    % init particles
    pos = -5 + 10 * rand(num_particles, 2);
    vel = zeros(num_particles, 2);
    
    % set init. best values
    p_best_pos = pos;
    p_best_val = rastrigin(pos(:,1), pos(:,2));
    [g_best_val, best_idx] = min(p_best_val);
    g_best_pos = p_best_pos(best_idx, :);
    
    % init history
    history = zeros(max_iters, 1);
    
    for iter = 1:max_iters
        % velocity update
        r1 = rand(num_particles, 2);
        r2 = rand(num_particles, 2);
        vel = w.*vel + c1.*r1.*(p_best_pos - pos) + c2.*r2.*(g_best_pos - pos);
        
        % position update
        pos = pos + vel;
        
        % eval. update
        current_val = rastrigin(pos(:,1), pos(:,2));
        improved = current_val < p_best_val;
        
        p_best_val(improved) = current_val(improved);
        p_best_pos(improved, :) = pos(improved, :);
        
        % find glob. min.
        [current_g_best_val, current_best_idx] = min(p_best_val);
        if current_g_best_val < g_best_val
            g_best_val = current_g_best_val;
            g_best_pos = p_best_pos(current_best_idx, :);
        end
        
        history(iter) = g_best_val;
        
        % clear axes and plot
        cla;
        contourf(X, Y, rastrigin(X,Y), 30, 'LineColor', 'none');
        scatter(pos(:,1), pos(:,2), 30, 'w', 'filled', 'MarkerEdgeColor', 'k');
        plot(g_best_pos(1), g_best_pos(2), 'r*', 'MarkerSize', 15, 'LineWidth', 2);
        drawnow;
    end
    
    writematrix(history, 'pso_convergence.csv');
    fprintf('Global best found at: (%.4f, %.4f)\n', g_best_pos(1), g_best_pos(2));
end