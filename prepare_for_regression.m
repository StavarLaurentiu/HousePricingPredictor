function [FeatureMatrix] = prepare_for_regression(InitialMatrix)
  [num_row num_col] = size(InitialMatrix);

  % Initializeaza matricea FutureMatrix
  FeatureMatrix = zeros(num_row,num_col+1);

  furnished_col = -1;
  % Cauta coloana "furnished"
  for i = 1:num_col
    if strcmp(InitialMatrix(1,i), "semi-furnished") == 1 || strcmp(InitialMatrix(1,i), "furnished") == 1 || strcmp(InitialMatrix(1,i), "unfurnished") == 1
      furnished_col = i;
    endif
  endfor

  % Transforma string-urile in int-uri
  for i = 1:num_row
    for j = 1:num_col
      if strcmp(InitialMatrix(i,j), "no") == 1
        FeatureMatrix(i,j) = 0;
      elseif strcmp(InitialMatrix(i,j), "yes") == 1
        FeatureMatrix(i,j) = 1;
      elseif strcmp(InitialMatrix(i,j), "unfurnished") == 1
        FeatureMatrix(i,j) = 0;
      elseif strcmp(InitialMatrix(i,j), "semi-furnished") == 1
        FeatureMatrix(i,j) = 1;
      elseif strcmp(InitialMatrix(i,j), "furnished") == 1
        FeatureMatrix(i,j) = 2;
      else
        FeatureMatrix(i,j) = str2double(InitialMatrix(i,j));
      endif
    endfor
  endfor

  % Daca nu avem colana de tipul "furnished" prelucrarea s-a incheiat
  if furnished_col == -1
    return;
  endif

  % Face spatiu pentru extinderea string-urilor de tipul 
  % "furnished" in doua coloane
  for i = 1:num_row
    for j = (num_col+1):-1:(furnished_col+1)
       FeatureMatrix(i,j) = FeatureMatrix(i,j-1);
    endfor
  endfor

  for i = 1:num_row
       if FeatureMatrix(i,furnished_col) == 0
         FeatureMatrix(i,furnished_col+1) = 1;
       endif
       if FeatureMatrix(i,furnished_col) == 1
         FeatureMatrix(i,furnished_col+1) = 0;
       endif
       if FeatureMatrix(i,furnished_col) == 2
          FeatureMatrix(i,furnished_col) = 0;
          FeatureMatrix(i,furnished_col+1) = 0;
       endif
  endfor

endfunction