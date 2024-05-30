function [det, growthFactor] = computeDetAndGrowthFactorUsingGE(A)
% input:
% A - Square matrix (n x n) for which we want to compute the determinant and growth factors.
% 
% outputs:
% det - Determinant of matrix A calculated using Gaussian Elimination.
% growthFactor - Growth factor using Gaussian Elimination.
%
% Description:
% This function computes the determinant of matrix A using GE.
% Additionally, it calculates the growth factor for GE method.
%
% Example usage:
% A = [5 -3 1; -8 9 0; 0 8 3];
% [det, growthFactor] = computeDetAndGrowthFactorUsingGE(A);
    % Get the size of matrix A
    n = size(A, 1);

    % Maximal element of the matrix before GE
    origin = max(abs(A(:)));

    % Element which will take the maximum element on each step
    current = origin;

    for i = 1:(n - 1)
        % Indices bellow the pivot
        j = (i + 1):n;

        % Multiplicity used to substruct j row
        multiplicitiy = A(j, i) / A(i, i);

        % Vectorization over columns
        A(j, i:end) = A(j, i:end) - multiplicitiy * A(i, i:end);
        
        % Getting the maximum element of matrix
        current = max(current, max(abs(A(:))));
    end

    % Linear indices of the diagonal elements
    indices_diagonal = 1:n+1:n^2; 
    det = prod(A(indices_diagonal));
    
    growthFactor = current / origin;
end