% visualizing a 2D matrix as a textured image map
clear; clc; close all;

% generate a dense grid of coordinates
x = linspace(-5, 5, 200);
y = linspace(-5, 5, 200);
[X, Y] = meshgrid(x, y);

% create a mathematical texture combining sine waves and a bit of gaussian random noise
Z = sin(X.^2) + cos(Y.^2) + 0.3 * randn(200, 200);

% plotting the matrix as an color image
figure;
imagesc(x, y, Z);
colormap('bone');
colorbar;
title('Simulated Texture Map');
xlabel('X coord.');
ylabel('Y coord.');