% first script (not a function!) to show off simple plotting

%% useful commands
% %% signifies a section in code
% commands for clearing variables, command window, and closing redundant 
% plot windows
clear; clc; close all;

%% first plot - vector arithmetic
% Distances from the start of the line in km
% e.g., Origin -> Station A -> Station B -> Station C
distances = [0, 55, 120, 210, 340]; 

d2 = distances(2);
d24 = distances(2:4);
d135 = distances([1 3 5]);
d3end = distances(3:end);

% Arrival times at each station in minutes from departure
times = [0, 45, 90, 140, 200];

% Calculate the distance covered between each consecutive stop
% diff() subtracts adjacent elements in a vector
leg_distances = diff(distances);
leg_times_hours = diff(times) / 60;

% Element-wise division (./) to find speed in km/h for each leg
leg_speeds = leg_distances ./ leg_times_hours;

% Plotting the results as a bar chart
figure;
bar(leg_speeds, 'FaceColor', 'flat');
title('High-Speed Rail: Average Speed Per Leg');
xlabel('Track Leg');
ylabel('Speed (km/h)');
grid on;

%% another plot - zeros, ones, steps
% x in range from 0 to 2*pi with step pi/30
x = 0:pi/30:2*pi;

% ys as predifined trigonometric functions sine and cosine
y1 = sin(x);
y2 = cos(x);

% ys as constant functions created by using predefined matrix of zeros and
% ones
% using command size(var, dim) to create a vector of zeros or ones, check
% workspace to see the corresponding dimension of x
y3 = zeros(1, size(x, 2));
y4 = 0.5*ones(size(x, 2));

% new figure
figure
% holding on to keep all plots in one figure
hold on
% simplest plot without any additional parameters
plot(x, y1);
% plot with -- line and wider line
plot(x, y2, '--', 'LineWidth', 2);
% two plots in one command - one with green xs, one with red os
plot(x, y3, 'gx', x, y4, 'or');
hold off
% plot title and legend
title('First plot');
legend('sin(x)', 'cos(x)', '0', '0.5');

%% second plot
% new x on [-1, 1] with step 0.1
x=-1:0.1:1; 
% transpose of x
x=x'; 	

% ys as various exponential functions
y1 = exp(x); 
y2 = exp(2*x); 
y3 = exp(x/2); 

% new figure, all plots in one command, added grid, limited axis range,
% axes labels
figure;
plot(x,[y1 y2 y3]);
grid;
% [x_left x_right y_lower y_upper]
axis([-1 1 0 10]);
title('Exponential functions');
% it is possible to use standard latex notation ...^{...}
leg = legend('e^x', 'e^{2x}', 'e^{x/2}');
title(leg, 'Legend');
xlabel('x');
ylabel('f(x)'); 

%% third plot
% various logarithms on [1, 100] with step 0.5
x = 1:0.5:100;
x = x';

y4 = log2(x);
y5 = log(x);
y6 = log(x)/log(6);
y7 = log10(x);

% new figure with 4 subplots
% using subplot(m, n, p) command - creates a m x n grid with p as the
% position in range 1:m*n
figure 
subplot(2, 2, 1);
plot(x, y4);
grid;
% using latex notation ..._{...} again
legend('log_{2}(x)');
xlabel('x');
ylabel('f(x)'); 

subplot(2, 2, 2);
plot(x, y5);
grid;
legend('ln(x)');
xlabel('x');
ylabel('f(x)'); 

subplot(2, 2, 3)
plot(x, y6)
grid;
legend('log_{6}(x)');
xlabel('x');
ylabel('f(x)'); 

subplot(2, 2, 4);
plot(x, y7);
grid;
legend('log_{10}(x)');
xlabel('x');
ylabel('f(x)'); 