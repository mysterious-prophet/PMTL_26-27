function manualEdgeFilter()
    % simple 10x10 synthetic image
    img = zeros(10, 10);
    img(4:7, 4:7) = 1;
    
    disp('Synthetic 10x10 image created.');

    % Sobel kernel's
    Gx = [-1 0 1; 
          -2 0 2; 
          -1 0 1];

    Gy = [-1 -2 -1;
        0 0 0;
        1 2 1];

    % gradient approx.
    G = sqrt(Gx.^2 + Gy.^2);

    edges_x = conv2(img, Gx, 'same');
    edges_y = conv2(img, Gy, "same");
    grad = conv2(img, G, "same");

    % plot original image, horizontal and vertical edges and the gradient
    figure;
    subplot(1, 4, 1);
    imagesc(img);
    title('Original');
    colormap('gray'); axis square;

    subplot(1, 4, 2);
    imagesc(edges_x);
    title('Horizontal Edges');
    colormap('gray'); axis square;

    subplot(1, 4, 3);
    imagesc(edges_y);
    title('Vertical Edges');
    colormap('gray'); axis square;

    subplot(1, 4, 4);
    imagesc(grad);
    title('Gradient');
    colormap('gray'); axis square;
end