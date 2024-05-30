function [detGE, detGECP, growthFactorGE, growthFactorGECP] = computeDetAndGrowthFactor(A)
% input:
% A - Square matrix (n x n) for which we want to compute the determinant and growth factors.
% 
% outputs:
% detGE - Determinant of matrix A calculated using Gaussian Elimination.
% detGECP - Determinant of matrix A calculated using Gaussian Elimination with Complete Pivoting.
% growthFactorGE - Growth factor using Gaussian Elimination.
% growthFactorGECP - Growth factor using Gaussian Elimination with Complete Pivoting.
%
% Description:
% This function computes the determinant of matrix A using GE and GECP.
% Additionally, it calculates the growth factors for GE and GECP methods.
%
% Example usage:
% A = [5 -3 1; -8 9 0; 0 8 3];
% [detGE, detGECP, growthFactorGE, growthFactorGECP] = computeDetAndGrowthFactor(A);

    % Get the size of matrix A
    [x, y] = size(A);
    
    % Check if A is a square matrix
    if x ~= y
        error('Matrix A must be square matrix');
    end

    [detGE, growthFactorGE] = computeDetAndGrowthFactorUsingGE(A);
    [detGECP, growthFactorGECP] = computeDetAndGrowthFactorUsingGECP(A);
end