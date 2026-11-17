function gameOfLife(grid_size, generations)
    if nargin < 1
        grid_size = 50;
        generations = 500;
    end

    % random binary grid (20% alive)
    grid = rand(grid_size, grid_size) < 0.2;
    
    % neighbor counting kernel
    kernel = [1 1 1; 
              1 0 1; 
              1 1 1];
    
    figure('Name', 'Conway''s Game of Life', 'Color', 'w');
    img_handle = imagesc(grid);
    % alive (1) is black, dead (0) is white
    colormap(flipud(gray));
    axis equal off;
    
    for i = 1:generations
        neighbors = conv2(double(grid), kernel, 'same');
        
        survive = grid & (neighbors == 2 | neighbors == 3);
        born = ~grid & (neighbors == 3);
        next_grid = survive | born;
        
        grid = next_grid;
        
        set(img_handle, 'CData', grid);
        drawnow;
    end
end