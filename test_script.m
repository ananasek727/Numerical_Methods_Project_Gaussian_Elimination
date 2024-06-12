format longE
size = 1000;


%% FIGURE 1
fprintf("#################################\n");
fprintf("Figure 1\n");
fprintf("#################################\n");
% Variables for report
average_error_GE_table = zeros(1, 3);
average_error_GECP_table = zeros(1, 3);
max_error_GE_table = zeros(1, 3);
max_error_GECP_table = zeros(1, 3);
% Run for matrix of size 6
error_detGE = zeros(1, size);
error_detGECP = zeros(1, size);
for i = 1:size
    % Create random matrix of size 6
    A = rand(6, 6);
    
    % Calculate using me function
    [detGE, detGECP, ~, ~] = computeDetAndGrowthFactor(A);    
    % Calculate determinant using MATLAB det() function
    determinant = det(A);

    % Store the results
    error_detGE(i) = abs(detGE - determinant);
    error_detGECP(i) = abs(detGECP - determinant);
    max_error_GE_table(1) = max(max_error_GE_table(1), error_detGE(i));
    max_error_GECP_table(1) = max(max_error_GECP_table(1), error_detGECP(i));
end
% Store the results for report
average_error_GE_table(1) = mean(error_detGE);
average_error_GECP_table(1) = mean(error_detGECP);

% Run for matrix of size 7
error_detGE = zeros(1, size);
error_detGECP = zeros(1, size);
for i = 1:size
    % Create random matrix of size 7
    A = rand(7, 7);
    
    % Calculate using me function
    [detGE, detGECP, ~, ~] = computeDetAndGrowthFactor(A);    
    % Calculate determinant using MATLAB det() function
    determinant = det(A);

    % Store the results
    error_detGE(i) = abs(detGE - determinant);
    error_detGECP(i) = abs(detGECP - determinant);
    max_error_GE_table(2) = max(max_error_GE_table(2), error_detGE(i));
    max_error_GECP_table(2) = max(max_error_GECP_table(2), error_detGECP(i));
end
% Store the results for report
average_error_GE_table(2) = mean(error_detGE);
average_error_GECP_table(2) = mean(error_detGECP);

% Run for matrix of size 8
error_detGE = zeros(1, size);
error_detGECP = zeros(1, size);
for i = 1:size
    % Create random matrix of size 8
    A = rand(8, 8);
    
    % Calculate using me function
    [detGE, detGECP, ~, ~] = computeDetAndGrowthFactor(A);    
    % Calculate determinant using MATLAB det() function
    determinant = det(A);

    % Store the results
    error_detGE(i) = abs(detGE - determinant);
    error_detGECP(i) = abs(detGECP - determinant);
    max_error_GE_table(3) = max(max_error_GE_table(3), error_detGE(i));
    max_error_GECP_table(3) = max(max_error_GECP_table(3), error_detGECP(i));
end
% Store the results for report
average_error_GE_table(3) = mean(error_detGE);
average_error_GECP_table(3) = mean(error_detGECP);


% Creating csv file
n_format = 6:1:8;
T = table(n_format', average_error_GE_table', average_error_GECP_table', ...
    max_error_GE_table', max_error_GECP_table', 'VariableNames' ...
    , {'n', 'average_error_GE', 'average_error_GECP', ...
    'max_error_GE', 'max_error_GECP'});

writetable(T,'Random_error.csv')

%% FIGURE 2
fprintf("#################################\n");
fprintf("Figure 2\n");
fprintf("#################################\n");

det_true = zeros(1, 3);
det_GE_table = zeros(1, 3);
det_GECP_table = zeros(1, 3);
error_detGE = zeros(1, 3);
error_detGECP = zeros(1, 3);
growthFactorGE_table = zeros(1, 3);
growthFactorGECP_table = zeros(1, 3);

% Random matrix of size 8
A = [
    -5, 5, -67, 15, 23, -25, 48, -66;
    16, -34, 83, -67, 29, 72, -11, 93;
    -17, 76, -10, 13, -58, 94, -49, 80;
    1, -43, 99, -7, 35, -25, 17, -88;
    -14, 20, -6, 6, -52, 66, -97, 71;
    29, -21, 13, -32, 9, -68, 10, -55;
    -28, 30, -59, 65, -22, 12, -30, 12;
    17, -19, 81, -14, 50, -9, 33, -65
];

% Calculate determinant using MATLAB det() function
determinant = det(A);
[detGE, detGECP, growthFactorGE, growthFactorGECP] = computeDetAndGrowthFactor(A);
fprintf("Random matrix of size 8\n");
fprintf("Determinant (MATLAB det()): %.6f\n", determinant);
fprintf("Determinant detGE: %.6f\n", detGE);
fprintf("Determinant detGECP: %.6f\n", detGECP);
fprintf("Determinant  error GE: %.6f\n", abs(detGE - determinant));
fprintf("Determinant  error GECP: %.6f\n", abs(detGECP - determinant));
fprintf("Growth factor GE: %.6f\n", growthFactorGE);
fprintf("Growth factor GECP: %.6f\n", growthFactorGECP);
fprintf("#################################\n");
det_true(1) = determinant;
det_GE_table(1) = detGE;
det_GECP_table(1) = detGECP;
growthFactorGE_table(1) = growthFactorGE;
growthFactorGECP_table(1) = growthFactorGECP;
error_detGE(1) = abs(detGE - determinant);
error_detGECP(1) = abs(detGECP - determinant);

% Column dominate matrix of size 6
A = [
    10, -2, 1, -1, 2, 8;
    -3, 12, 2, -1, 3, -2;
    2, -1, 14, 3, -2, -1;
    -1, 3, -2, 13, 1, 2;
    2, -3, -1, 2, 11, -1;
    -2, 1, -3, -1, 1, 20
];

% Calculate determinant using MATLAB det() function
determinant = det(A);
[detGE, detGECP, growthFactorGE, growthFactorGECP] = computeDetAndGrowthFactor(A);
fprintf("Column dominate matrix of size 6\n");
fprintf("Determinant (MATLAB det()): %.6f\n", determinant);
fprintf("Determinant detGE: %.6f\n", detGE);
fprintf("Determinant detGECP: %.6f\n", detGECP);
fprintf("Determinant  error GE: %.6f\n", abs(detGE - determinant));
fprintf("Determinant  error GECP: %.6f\n", abs(detGECP - determinant));
fprintf("Growth factor GE: %.6f\n", growthFactorGE);
fprintf("Growth factor GECP: %.6f\n", growthFactorGECP);
fprintf("#################################\n");
det_true(2) = determinant;
det_GE_table(2) = detGE;
det_GECP_table(2) = detGECP;
growthFactorGE_table(2) = growthFactorGE;
growthFactorGECP_table(2) = growthFactorGECP;
error_detGE(2) = abs(detGE - determinant);
error_detGECP(2) = abs(detGECP - determinant);

% Row dominate matrix of size 6
A = [
    38, 12, -5, -7, 7, -6;
    10, 52, 6, -12, 20, -1;
    2, -1, 90, 12, -30, -41;
    -5, 7, -12, 130, 56, 48;
    -8, -3, -8, 2, 30, -5;
    -4, 1, -23, -14, 1, 60
];
% Calculate determinant using MATLAB det() function
determinant = det(A);
[detGE, detGECP, growthFactorGE, growthFactorGECP] = computeDetAndGrowthFactor(A);
fprintf("Row dominate matrix of size 6\n");
fprintf("Determinant (MATLAB det()): %.6f\n", determinant);
fprintf("Determinant detGE: %.6f\n", detGE);
fprintf("Determinant detGECP: %.6f\n", detGECP);
fprintf("Determinant  error GE: %.6f\n", abs(detGE - determinant));
fprintf("Determinant  error GECP: %.6f\n", abs(detGECP - determinant));
fprintf("Growth factor GE: %.6f\n", growthFactorGE);
fprintf("Growth factor GECP: %.6f\n", growthFactorGECP);
fprintf("#################################\n");
det_true(3) = determinant;
det_GE_table(3) = detGE;
det_GECP_table(3) = detGECP;
growthFactorGE_table(3) = growthFactorGE;
growthFactorGECP_table(3) = growthFactorGECP;
error_detGE(3) = abs(detGE - determinant);
error_detGECP(3) = abs(detGECP - determinant);

% Creating csv file
T = table(det_true', det_GE_table', det_GECP_table', growthFactorGE_table', ...
    growthFactorGECP_table', error_detGE', error_detGECP', 'VariableNames' ...
    , {'det_true', 'det_GE', 'det_GECP', 'error_detGE', 'growthFactorGE', ...
    'growthFactorGECP', 'error_detGECP'});

writetable(T,'Random_error_2.csv')

%% FIGURE 3
fprintf("#################################\n");
fprintf("Figure 3\n");
fprintf("#################################\n");
% Variables for report
average_time_GE_table = zeros(1, 3);
average_time_GECP_table = zeros(1, 3);
max_time_GE_table = zeros(1, 3);
max_time_GECP_table = zeros(1, 3);

% Run for matrix size 6
time_GE = zeros(1, size);
time_GECP = zeros(1, size);
for i = 1:size
    % Create random matrix of size 6
    A = randi([1, 100], 6);
    tic
    [~, ~] = computeDetAndGrowthFactorUsingGE(A);
    time_GE(i) = toc;
    max_time_GE_table(1) = max(max_time_GE_table(1), time_GE(i));
    tic
    [~, ~] = computeDetAndGrowthFactorUsingGECP(A);
    time_GECP(i) = toc;
    max_time_GECP_table(1) = max(max_time_GECP_table(1), time_GECP(i));
end
average_time_GE_table(1) = mean(time_GE);
average_time_GECP_table(1) = mean(time_GECP);

% Run for matrix size 7
time_GE = zeros(1, size);
time_GECP = zeros(1, size);
for i = 1:size
    % Create random matrix of size 7
    A = randi([1, 100], 7);
    tic
    [~, ~] = computeDetAndGrowthFactorUsingGE(A);
    time_GE(i) = toc;
    max_time_GE_table(2) = max(max_time_GE_table(2), time_GE(i));
    tic
    [~, ~] = computeDetAndGrowthFactorUsingGECP(A);
    time_GECP(i) = toc;
    max_time_GECP_table(2) = max(max_time_GECP_table(2), time_GECP(i));
end
average_time_GE_table(2) = mean(time_GE);
average_time_GECP_table(2) = mean(time_GECP);

% Run for matrix size 8
time_GE = zeros(1, size);
time_GECP = zeros(1, size);
for i = 1:size
    % Create random matrix of size 8
    A = randi([1, 100], 8);
    tic
    [~, ~] = computeDetAndGrowthFactorUsingGE(A);
    time_GE(i) = toc;
    max_time_GE_table(3) = max(max_time_GE_table(3), time_GE(i));
    tic
    [~, ~] = computeDetAndGrowthFactorUsingGECP(A);
    time_GECP(i) = toc;
    max_time_GECP_table(3) = max(max_time_GECP_table(3), time_GECP(i));
end
average_time_GE_table(3) = mean(time_GE);
average_time_GECP_table(3) = mean(time_GECP);

% Creating csv file
n_format = 6:1:8;
T = table(n_format', average_time_GE_table', average_time_GECP_table', ...
    max_time_GE_table', max_time_GECP_table', 'VariableNames' ...
    , {'n', 'average_time_GE', 'average_time_GECP', ...
    'max_time_GE', 'max_time_GECP'});

writetable(T,'Random_time.csv')
