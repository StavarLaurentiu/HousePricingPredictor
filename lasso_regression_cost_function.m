function [Error] = lasso_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
    % Preia dimensiunea matricii de caracteristici
    [m, n] = size(FeatureMatrix);

    sum = 0;
    for i = 1 : m
        x = 0;
        for j = 2 : n+1
            x += FeatureMatrix(i, j-1) * Theta(j, 1);
        endfor
        sum += (Y(i, 1) - x) ^ 2;
    endfor
    
    % Calculeaza eroarea
    Error = sum / m + lambda * (norm(Theta, 1));

endfunction