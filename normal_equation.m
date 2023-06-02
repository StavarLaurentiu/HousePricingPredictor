function [Theta] = normal_equation(FeaturesMatrix, Y, tol, iter)
  [num_row num_col] = size(FeaturesMatrix);
  Theta = zeros(num_col,1);

  % Verifica ca matricea este pozitiv definita
  Matrix = FeaturesMatrix' * FeaturesMatrix;
  % Preia vectorii si valorile proprii
  [V, D] = eig(Matrix);
  % Daca exista o valoare proprie mai mica 
  % sau egala cu 0 nu se poate aplica metoda
  if any(diag(D) <= 0)
    Theta = vertcat(0, Theta);
    return;
  endif

  % Metoda gradientului conjugat
  r = FeaturesMatrix' * Y - Matrix * Theta;
  v = r;
  tolsquared = tol ^ 2;
  k = 1;
  while k <= iter && r' * r > tolsquared
    t = (r' * r) / (v' * Matrix * v);
    Theta = Theta + t * v;
    old_r = r;
    r = r - t * Matrix * v;
    s = (r' * r) / (old_r' * old_r);
    v = r + s * v;
    k = k + 1;
  endwhile

  Theta = vertcat(0, Theta);
endfunction