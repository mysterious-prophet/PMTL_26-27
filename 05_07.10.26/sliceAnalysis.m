function sliceAnalysis()
    % randn matrix, with center moved by a constant
    scan_matrix = randn(50, 50); 
    scan_matrix(20:30, 20:30) = scan_matrix(20:30, 20:30) + 5; 

    % raw matrix properties and plots
    raw_max = max(scan_matrix(:));
    raw_min = min(scan_matrix(:));
    fprintf('Raw Matrix - Min: %.2f, Max: %.2f\n', raw_min, raw_max);

    figure;
    subplot(1, 2, 1);
    imagesc(scan_matrix);
    colormap('gray'); 
    title('Raw Scan Matrix');
    axis square;

    disp('Matrix loaded. Waiting for thresholding logic...');

    % norm. matrix
    scan_norm = (scan_matrix - raw_min) / (raw_max - raw_min);

    % bin. mask creation
    scan_binary = scan_norm > 0.6;

    % plot bin mask
    subplot(1, 2, 2);
    imagesc(scan_binary);
    colormap('gray'); 
    title('Binary Mask (>0.6)');
    axis square;

    % numel() returns the total number of elements in an array
    pct_active = (sum(scan_binary(:)) / numel(scan_binary)) * 100;
    fprintf('Active pixels: %.2f%%\n', pct_active);
end