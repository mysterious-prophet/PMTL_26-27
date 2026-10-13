function colorFilter()
    img = imread('peppers.png');
    
    % convert from uint8 to double
    img_double = double(img);
    
    % extract individual color channels
    R = img_double(:,:,1);
    G = img_double(:,:,2);
    B = img_double(:,:,3);
    
    figure;
    subplot(1, 2, 1); 
    imshow(img); 
    title('Original RGB');

    % logical mask
    is_red = (R > 150) & (G < 100) & (B < 100);
    

    % create and show the filtered image
    filtered_img = zeros(size(img_double));
    filtered_img(:,:,1) = R .* is_red;
    filtered_img(:,:,2) = G .* is_red;
    filtered_img(:,:,3) = B .* is_red;
    
    filtered_img = uint8(filtered_img);
    subplot(1, 2, 2);
    imshow(filtered_img);
    title('Isolated Red Sectors');
end