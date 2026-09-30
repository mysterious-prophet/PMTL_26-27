clear; clc;

%% adjacency matrix of a transit ring line
% simple 4-station circular metro line
% A(i, j) = 1 if there is a direct track between station i and j
A = [0 1 0 1; 
     1 0 1 0; 
     0 1 0 1; 
     1 0 1 0];

disp('Direct connections (Adjacency Matrix A):');
disp(A);

%% calculating paths using matrix multiplication
% A^2 gives the number of ways to get from station i to j with exactly 2 stops
A_squared = A * A;

disp('Number of 2-stop paths between stations (A^2):');
disp(A_squared);

% A^3 gives the number of ways to get from station i to j with exactly 3 stops
A_cubed = A^3;

disp('Number of 3-stop paths between stations (A^3):');
disp(A_cubed);