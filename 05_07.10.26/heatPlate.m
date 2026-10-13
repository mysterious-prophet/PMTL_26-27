function heatPlate(iterations)
    if nargin < 1
        iterations = 500;
    end

    grid_size = 30;
    plate = zeros(grid_size, grid_size);
    
    % Set boundary conditions (heat sources)
    plate(1, :) = 100;
    plate(:, end) = 50;
    
    figure; 
    colormap('hot');

    % calculate and plot the heat spreading
    for iter = 1:iterations

        pause(0.05);
        new_plate = plate;
        
        for i = 2:(grid_size-1)
            for j = 2:(grid_size-1)
                new_plate(i,j) = (plate(i-1, j) + plate(i+1, j) + ...
                                  plate(i, j-1) + plate(i, j+1)) / 4;
            end
        end
        
        plate = new_plate;
        
        % animation
        imagesc(plate);
        colorbar; 
        clim([0 100]); 
        title(sprintf('Heat Diffusion (Iteration %d)', iter));
        drawnow;
    end
end