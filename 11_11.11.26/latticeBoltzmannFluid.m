function latticeBoltzmannFluid()
    % D2Q9 lattice parameters
    Nx = 150; Ny = 60;
    % kinematic viscosity
    tau = 0.6;
    omega = 1 / tau;
    
    % 9 discrete directions
    cx = [0, 1, 0, -1, 0, 1, -1, -1, 1];
    cy = [0, 0, 1, 0, -1, 1, 1, -1, -1];
    w = [4/9, 1/9, 1/9, 1/9, 1/9, 1/36, 1/36, 1/36, 1/36];
    
    % init. distribution functions to equilibrium with velocity in +x
    u_in = 0.1;
    f = zeros(Ny, Nx, 9);
    for i = 1:9
        cu = 3 * (cx(i)*u_in + cy(i)*0);
        f(:,:,i) = w(i) * (1 + cu + 0.5*cu.^2 - 1.5*(u_in^2));
    end
    
    % solid cylinder mask
    [X, Y] = meshgrid(1:Nx, 1:Ny);
    obstacle = (X - Nx/4).^2 + (Y - Ny/2).^2 < 8^2;
    
    figure;
    colormap('jet');
    
    for step = 1:2000
        % macroscopic variables
        rho = sum(f, 3);
        ux = zeros(Ny, Nx); uy = zeros(Ny, Nx);
        for i = 1:9
            ux = ux + f(:,:,i) * cx(i);
            uy = uy + f(:,:,i) * cy(i);
        end
        ux = ux ./ rho; uy = uy ./ rho;
        
        % obstacle velocity to 0
        ux(obstacle) = 0; uy(obstacle) = 0;
        
        % collision step
        for i = 1:9
            cu = 3 * (cx(i)*ux + cy(i)*uy);
            f_eq = rho .* w(i) .* (1 + cu + 0.5*cu.^2 - 1.5*(ux.^2 + uy.^2));
            f(:,:,i) = f(:,:,i) + omega * (f_eq - f(:,:,i));
        end
        
        % bounce-back boundaries (opposite pairs: 2-4, 3-5, 6-8, 7-9)
        bounce = [1, 4, 5, 2, 3, 8, 9, 6, 7];
        f_temp = f;
        for i = 1:9
            % matrix for channel i, applying it only to obstacle cells
            f_i = f(:,:,i); f_bounce = f_temp(:,:,bounce(i));
            f_i(obstacle) = f_bounce(obstacle);
            f(:,:,i) = f_i;
        end
        
        % streaming step
        for i = 1:9
            f(:,:,i) = circshift(f(:,:,i), [cy(i), cx(i)]);
        end
        
        % inflow boundary, left wall
        for i = 1:9
            cu = 3 * (cx(i)*u_in + cy(i)*0);
            f(:,1,i) = w(i) * (1 + cu + 0.5*cu.^2 - 1.5*(u_in^2));
        end
        
        % visualization
        if mod(step, 20) == 0
            vel_mag = sqrt(ux.^2 + uy.^2);
            vel_mag(obstacle) = 0;
            imagesc(vel_mag);
            title(sprintf('Lattice Boltzmann Flow (Step %d)', step));
            drawnow;
        end
    end
end