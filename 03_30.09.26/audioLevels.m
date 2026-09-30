clear; clc; close all;

%% gen. data
% generate simulated time and decibel data for a live concert
t_minutes = 0:0.5:90; 
% base volume of 95 dB + low frequency waves + random crowd noise
decibels = 95 + 15*sin(2*pi*t_minutes/15) + 5*randn(1, length(t_minutes));

%% plot initial data
figure;
hold on;
plot(t_minutes, decibels, 'b-', 'LineWidth', 1.5);
% draw a safe exposure limit line at 105 dB
yline(105, 'k--', 'Danger Threshold (105 dB)', 'LineWidth', 1.5);

title('Live Concert Audio Levels');
xlabel('Time (minutes)'); ylabel('Volume (dB)');
grid on;

%% danger zone indcs, plot, percentage
danger_idx = decibels > 105;
danger_times = t_minutes(danger_idx);
danger_levels = decibels(danger_idx);

plot(danger_times, danger_levels, 'ro', 'MarkerFaceColor', 'r');

percent_danger = (sum(danger_idx) / length(decibels)) * 100;
fprintf('Percentage of concert spent in danger zone: %.1f%%\n', percent_danger);