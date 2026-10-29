function svdImageCompression(k_values)
    if nargin < 1
        % singular values to keep
        k_values = [10, 30, 50]; 
    end

    % load a built in grayscale image
    img = imread('cameraman.tif');
    img_double = double(img);
    
    [rows, cols] = size(img_double);
    fprintf('Original image size: %dx%d\n', rows, cols);
    
    figure;
    subplot(1, length(k_values)+1, 1);
    imagesc(img);
    colormap('gray');
    axis square;
    title('Original');
    
    % use built in singular value decomp.
    [U, S, V] = svd(img_double);
    
    for i = 1:length(k_values)
        k = k_values(i);
        
        % keep k values
        U_k = U(:, 1:k);
        S_k = S(1:k, 1:k);
        V_k = V(:, 1:k);
        
        % compress image
        compressed_double = U_k * S_k * V_k';
        compressed_uint8 = uint8(compressed_double);
        
        subplot(1, length(k_values)+1, i+1);
        imagesc(compressed_uint8); 
        colormap('gray');
        axis square;
        title(sprintf('Compressed (k=%d)', k));
        
        % save one image to a .png
        if k == 50
            imwrite(compressed_uint8, 'cameraman_compressed.png');
            disp('Saved k=50 version to cameraman_compressed.png');
        end
    end
end