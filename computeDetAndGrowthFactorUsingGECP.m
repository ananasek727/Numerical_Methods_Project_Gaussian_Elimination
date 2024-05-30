function [det,growthFactor] = computeDetAndGrowthFactorUsingGECP(A)
% input:
% A - Square matrix (n x n) for which we want to compute the determinant and growth factors.
% 
% outputs:
% det - Determinant of matrix A calculated using Gaussian Elimination with Compleate Pivoting.
% growthFactor - Growth factor using Gaussian Elimination with Compleate Pivoting.
%
% Description:
% This function computes the determinant of matrix A using GECP.
% Additionally, it calculates the growth factor for GECP method.
%
% Example usage:
% A = [5 -3 1; -8 9 0; 0 8 3];
% [det, growthFactor] = computeDetAndGrowthFactorUsingGECP(A);
    % Get the size of matrix A
    n = size(A, 1);

    % Store the number of swaps
    swaps_count = 0;

    % Maximal element of the matrix before GE
    origin = max(abs(A(:)));

    % Element which will take the maximum element on each step
    current = origin;  

    for i = 1:n-1
        % Find the index of largest element in matrix A(i:n, i:n)
        [~, index] = max(abs(A(i:n, i:n)), [], "all", 'linear');
        % Decode index into coordinates
        
        % Row index
        k = mod(index - 1, n - i + 1) + 1;
        % Column index
        l = ((index - k) / (n - i + 1)) + 1 ;

        % Adjust the row and column indices
        % Translate these indices to the full matrix indices
        k = k + i - 1;
        l = l + i - 1;
        
        % Swap rows and columns if necessary
        if k ~= i
            A([k, i], :) = A([i, k], :);
            swaps_count = swaps_count + 1;
        end
        if l ~= i
            A(:, [l, i]) = A(:, [i, l]);
            swaps_count = swaps_count + 1;
        end
        
        % Check for zero pivot element to avoid division by zero
        if A(i, i) == 0
            error('Zero pivot encountered. Division by 0 not possible');
        end

        % Indices bellow the pivot
        z = (i + 1):n;

        % Multiplicity used to substruct j row
        multiplicitiy = A(z, i) / A(i, i);

        % Vectorization over columns
        A(z, i:end) = A(z, i:end) - multiplicitiy * A(i, i:end);
        
        % Making sure that elements bellow pivots are zeros
        A((i + 1):n, i) = 0;
        
        % Getting the maximum element of matrix
        current = max(current, max(abs(A(:))));
    end
    
    % Linear indices of the diagonal elements
    indices_diagonal = 1:n+1:n^2;

    % Calculating the determinate by multiplying diagonal elements
    det = prod(A(indices_diagonal));
    
    % Adjust sign of determinant based on number of swaps
    if mod(swaps_count, 2) == 1
        det = -det;
    end

    % Calculating the growth factor of a matrix
    growthFactor = current / origin;
end
