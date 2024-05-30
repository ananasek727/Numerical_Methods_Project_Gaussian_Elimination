format longE
size = 40;


%% FIGURE 1

error_detGE = zeros(1, size);
error_detGECP = zeros(1, size);
for i = 1:size
    % Create random matrix of size i
    A = rand(i, i);
    
    [detGE, detGECP, growthFactorGE, growthFactorGECP] = computeDetAndGrowthFactor(A);
    
    % Calculate determinant using MATLAB det() function
    determinant = det(A);
    
    % Display results
    fprintf("Matrix with size %d \n", i);
    fprintf("Determinant (MATLAB det()): %.6f\n", determinant);
    fprintf("Determinant  error GE: %.6f\n", abs(detGE - determinant));
    fprintf("Determinant  error GECP: %.6f\n", abs(detGECP - determinant));
    fprintf("Growth factor GE: %.6f\n", growthFactorGE);
    fprintf("Growth factor GECP: %.6f\n", growthFactorGECP);
    fprintf("#################################\n");

    % Store the results
    error_detGE(i) = abs(detGE - determinant);
    error_detGECP(i) = abs(detGECP - determinant);

end

% Creating csv file
n_format = 1:1:size;
T = table(n_format', error_detGE', error_detGECP', 'VariableNames' ...
    , {'n', 'error_detGE', 'error_detGECP'});

writetable(T,'Random_error.csv')

%% FIGURE 2

error_detGE = zeros(1, 3);
error_detGECP = zeros(1, 3);

% Row dominate matrix
A = [4, 1, 1; 2, 6, 2; 1, 1, 3];

% Calculate determinant using MATLAB det() function
determinant = det(A);
[detGE, detGECP, growthFactorGE, growthFactorGECP] = computeDetAndGrowthFactor(A);
fprintf("Row dominate matrix\n");
fprintf("Determinant (MATLAB det()): %.6f\n", determinant);
fprintf("Determinant  error GE: %.6f\n", abs(detGE - determinant));
fprintf("Determinant  error GECP: %.6f\n", abs(detGECP - determinant));
fprintf("Growth factor GE: %.6f\n", growthFactorGE);
fprintf("Growth factor GECP: %.6f\n", growthFactorGECP);
fprintf("#################################\n");
error_detGE(1) = abs(detGE - determinant);
error_detGECP(1) = abs(detGECP - determinant);

% Column dominate matrix
A = [2, -1, 0; -2, 3, -1; 1, -1, 4];

% Calculate determinant using MATLAB det() function
determinant = det(A);
[detGE, detGECP, growthFactorGE, growthFactorGECP] = computeDetAndGrowthFactor(A);
fprintf("Column dominate matrix\n");
fprintf("Determinant (MATLAB det()): %.6f\n", determinant);
fprintf("Determinant  error GE: %.6f\n", abs(detGE - determinant));
fprintf("Determinant  error GECP: %.6f\n", abs(detGECP - determinant));
fprintf("Growth factor GE: %.6f\n", growthFactorGE);
fprintf("Growth factor GECP: %.6f\n", growthFactorGECP);
fprintf("#################################\n");
error_detGE(2) = abs(detGE - determinant);
error_detGECP(2) = abs(detGECP - determinant);

% Column dominate matrix
A = [1,1,2,3; 5,8,-1,-7; -10, -10, 2, 4; 6,8,9,9];

% Calculate determinant using MATLAB det() function
determinant = det(A);
[detGE, detGECP, growthFactorGE, growthFactorGECP] = computeDetAndGrowthFactor(A);
fprintf("My random matrix\n");
fprintf("Determinant (MATLAB det()): %.6f\n", determinant);
fprintf("Determinant  error GE: %.6f\n", abs(detGE - determinant));
fprintf("Determinant  error GECP: %.6f\n", abs(detGECP - determinant));
fprintf("Growth factor GE: %.6f\n", growthFactorGE);
fprintf("Growth factor GECP: %.6f\n", growthFactorGECP);
fprintf("#################################\n");
error_detGE(3) = abs(detGE - determinant);
error_detGECP(3) = abs(detGECP - determinant);

% Creating csv file
T = table(error_detGE', error_detGECP', 'VariableNames' ...
    , {'error_detGE', 'error_detGECP'});

writetable(T,'Random_error_2.csv')

%% FIGURE 3

size = 100;
time_GE = zeros(1, size);
time_GECP = zeros(1, size);
for i = 1:size
    % Create random matrix of size i
    A = randi([1, 30], i);
    tic
    [~, ~] = computeDetAndGrowthFactorUsingGE(A);
    time_GE(i) = toc;
    tic
    [~, ~] = computeDetAndGrowthFactorUsingGECP(A);
    time_GECP(i) = toc;
end

% Creating csv file
n_format = 1:1:size;
T = table(n_format', time_GE', time_GECP', 'VariableNames' ...
    , {'n', 'time_GE', 'time_GECP'});

writetable(T,'Random_time.csv')
