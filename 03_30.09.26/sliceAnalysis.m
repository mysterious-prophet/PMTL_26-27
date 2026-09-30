clear; clc; close all;

% generate a 50x50 matrix with a "signal" in the center and random noise everywhere
scan_matrix = randn(50, 50); 
scan_matrix(20:30, 20:30) = scan_matrix(20:30, 20:30) + 5; 

% raw matrix properties
raw_max = max(scan_matrix(:));
raw_min = min(scan_matrix(:));
fprintf('Raw Matrix - Min: %.2f, Max: %.2f\n', raw_min, raw_max);

figure;
subplot(1, 2, 1);
imagesc(scan_matrix);
colormap('gray'); title('Raw Scan Matrix');
axis square;