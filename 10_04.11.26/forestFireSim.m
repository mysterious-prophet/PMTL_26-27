function forestFireSim()
    % grid size and probability of fire spreading
    grid_size = 50;
    catch_prob = 0.6;
    
    % 0 = empty, 1 = tree, 2 = fire, 3 = burnt
    % randomly plant trees with a 65% density
    forest = zeros(grid_size, grid_size);
    forest(rand(grid_size, grid_size) < 0.65) = 1;
    
    % ignite the center of the forest
    forest(25, 25) = 2;
    
    % custom color map: white (empty), green (tree), red (fire), black (burnt)
    my_colors = [1 1 1; 0 0.8 0; 1 0 0; 0.2 0.2 0.2];
    figure;
    colormap(my_colors);

    while any(forest(:) == 2)
        pause(0.2)
        new_forest = forest;
        
        for r = 2:(grid_size-1)
            for c = 2:(grid_size-1)
                
                % catching fire
                if forest(r, c) == 1
                    neighbor_fire = (forest(r-1, c) == 2) || (forest(r+1, c) == 2) || ...
                                    (forest(r, c-1) == 2) || (forest(r, c+1) == 2 || ...
                                    (forest(r-1, c-1) == 2) || (forest(r-1, c+1) == 2) || ...
                                    (forest(r+1, c-1) == 2) || (forest(r+1, c+1) == 2));
                                    
                    if neighbor_fire && (rand() < catch_prob)
                        new_forest(r, c) = 2;
                    end
                    
                % fire burning out
                elseif forest(r, c) == 2
                    new_forest(r, c) = 3;
                end
                
            end
        end
        
        % animation
        forest = new_forest;
        imagesc(forest);
        clim([0 3]);
        title('Stochastic Forest Fire');
        drawnow;
    end
    
    writematrix(forest, 'post_fire_survey.csv');
    disp('Fire extinguished. Final state saved to post_fire_survey.csv');
end