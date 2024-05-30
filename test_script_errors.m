% This script will test the error

format longE

%% Not square matrix

A = [1, 2, 3; 2, 6, 10];
try
    [~, ~, ~, ~] = computeDetAndGrowthFactor(A);
    % If no error occurs, the test fails
    error('Test failed');
    catch ME
        % Check if the error message matches the expected one
        expectedErrorMsg = 'Matrix A must be square matrix';
        if strcmp(ME.message, expectedErrorMsg)
            disp('Test passed');
        else
            error('Test failed: Unexpected error message');
        end
end
%% Matrix with zero pivot

% For GE
A = [0, 0, 5; 0, 15, 3; 1, 5, 10];

try
    [~, ~] = computeDetAndGrowthFactorUsingGE(A);
    % If no error occurs, the test fails
    error('Test failed');
    catch ME
        % Check if the error message matches the expected one
        expectedErrorMsg = 'Zero pivot encountered. Division by 0 not possible';
        if strcmp(ME.message, expectedErrorMsg)
            disp('Test passed');
        else
            error('Test failed: Unexpected error message');
        end
end

% For GECP
A = [0, 0, 0; 0, 0, 0; 1, 5, 10];

try
    [~, ~] = computeDetAndGrowthFactorUsingGECP(A);
    % If no error occurs, the test fails
    error('Test failed');
    catch ME
        % Check if the error message matches the expected one
        expectedErrorMsg = 'Zero pivot encountered. Division by 0 not possible';
        if strcmp(ME.message, expectedErrorMsg)
            disp('Test passed');
        else
            error('Test failed: Unexpected error message');
        end
end