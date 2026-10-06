function chessBoardMatrix(n_size)
    if nargin < 1
        n_size = 8;
    end

    board = zeros(n_size, n_size);

    % solution using nested for cycles
    for i = 1:n_size
        for j = 1:n_size
            if mod(i + j, 2) == 0
                board(i, j) = 1;
            end
        end
    end

    % or, solution with vectorization
    % i = (1:n_size)';
    % j = (1:n_size);
    % board = mod(i + j, 2) == 0;

    figure;
    imagesc(board);
    colormap('gray');
    axis equal;
    axis tight;
    title(sprintf('Chessboard Matrix (%dx%d)', n_size, n_size));
end