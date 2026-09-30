clear; clc;

% declare and initialize a global variable
global filterThreshold;
filterThreshold = 0.5;

% create an anonymous function representing a dampening effect
dampenSignal = @(x) sin(x) .* exp(-0.1 * x);

% generate some input data
x_data = 0:0.1:10;

filtered_data = applyFilter(dampenSignal, x_data);

figure;
plot(x_data, filtered_data, 'LineWidth', 2);
title('Filtered Signal');
xlabel('x'); ylabel('y');
grid on;

% pass function handle and data
function result = applyFilter(fcnHandle, data)
    % access global variable
    global filterThreshold;
    
    result = fcnHandle(data);
    result(result < filterThreshold) = 0;
end