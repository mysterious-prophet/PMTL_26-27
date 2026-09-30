% handling strings as arrays of characters and string manipulation
clear; clc;

%% character arrays vs. strings
% char array - single quotes
char_station = 'Ljubljana'; 
% string - double quotes
str_station = "Trieste";     

%% string manipulation
route_log = "Galway, Dublin, Killarney";

% split the string into an array of substrings based on the comma
stations = split(route_log, ", ");

disp('Parsed Transit Stations:');
for i = 1:length(stations)
    % using fprintf to format the output with the string placeholder %s
    fprintf('Station %d: %s\n', i, stations(i));
end

%% string concatenation
% joining strings back together with a different delimiter
new_route = join(stations, " -> ");
fprintf('\nUpdated Route: %s\n', new_route);