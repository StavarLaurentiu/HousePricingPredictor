function [Error] = linear_regression_cost_function(Theta, Y, FeatureMatrix)

  % Adauga o coloana de 1 la matricea de caracteristici
  FeatureMatrix = [ones(size(FeatureMatrix, 1), 1), FeatureMatrix];

  % Calculeaza h(x) = Theta' * FeatureMatrix
  h = FeatureMatrix * Theta;

  % Calculeaza eroarea patratica medie
  SquaredErrors = (h - Y) .^ 2;
  Error = sum(SquaredErrors) / (2 * length(Y));

endfunction
