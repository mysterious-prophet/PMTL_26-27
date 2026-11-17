function waveEquation2D()
    % simulation params.
    grid_size = 100;
    % wave speed, time step, spatial step, courant number < 0.5
    c = 1;
    dt = 0.05;
    dx = 0.1;
    alpha = (c * dt / dx)^2;
    
    % initialize grids
    U_prev = zeros(grid_size, grid_size);
    U_curr = zeros(grid_size, grid_size);
    U_next = zeros(grid_size, grid_size);
    
    % initial perturbation - a water drop in the center
    [X, Y] = meshgrid(1:grid_size, 1:grid_size);
    drop = exp(-0.1 * ((X - grid_size/2).^2 + (Y - grid_size/2).^2));
    U_curr = U_curr + drop;
    U_prev = U_curr;
    
    figure;
    surf_handle = surf(U_curr, 'EdgeColor', 'none');
    zlim([-1 1]);
    colormap("abyss"); 
    title('2D Wave Equation Simulation');
    
    for t = 1:500
        % vectorized Laplacian kernel
        U_up = U_curr(1:end-2, 2:end-1);
        U_down = U_curr(3:end,   2:end-1);
        U_left = U_curr(2:end-1, 1:end-2);
        U_right = U_curr(2:end-1, 3:end);
        U_cent = U_curr(2:end-1, 2:end-1);
        
        laplacian = U_up + U_down + U_left + U_right - 4 * U_cent;
        
        U_next(2:end-1, 2:end-1) = 2*U_cent - U_prev(2:end-1, 2:end-1) + alpha * laplacian;
        
        U_prev = U_curr;
        U_curr = U_next;
        
        set(surf_handle, 'ZData', U_curr);
        pause(0.03);
        drawnow;
    end
end