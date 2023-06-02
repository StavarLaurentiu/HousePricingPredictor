function [Theta] = gradient_descent(FeatureMatrix, Y, n, m, alpha, iter)
  % Theta initial este nul
  Theta = zeros(n, 1);

  % Calculeaza costul si gradientul la fiecare pas
  for i = 1:iter
      % Calculeaza predictia
      h = FeatureMatrix * Theta;

      error = h - Y;
      gradient = (1/m) * (FeatureMatrix' * error);
      Theta = Theta - alpha * gradient;
  endfor

  % Adauga un element egal cu 0 in Theta pentru a putea calcula costul
  Theta = [0; Theta];
endfunction