function [Error] = ridge_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
    % Preia dimensiunile matricii de caracteristici
    [m n] = size(FeatureMatrix);

    sum1 = 0;
    for j = 2 : n+1
        sum1 += Theta(j, 1) ^ 2;
    endfor

    sum2 = 0;
    for i = 1 : m
        x = 0;
        for j = 2 : n+1
            x += FeatureMatrix(i, j-1) * Theta(j, 1);
        endfor
        sum2 += (Y(i, 1) - x) ^ 2;
    endfor
 
    % Calculeaza eroarea
    Error = sum2 / (2 * m) + lambda * sum1;

endfunction