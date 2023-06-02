function [Y, InitialMatrix] = parse_data_set_file(file_path)
  fid = 0;

  % deschide fisierul
  while fid < 1
    [fid, mesaj] = fopen(file_path, "r");
    if fid == -1
      disp(mesaj);
    endif
  endwhile

  % Citeste dimensiunile matricii
  [num_row, num_col, count, err] = fscanf(fid, "%d %d", "C");

  % Declara matricea InitialMatrix de tip cell (matrice se string-uri)
  InitialMatrix = {};

  % Declara matricea Y drept vector coloana
  Y = zeros(num_row,1);

  % Populeaza matricea cu codificarile din fisier
  for i = 1:num_row
    [Y(i,1), count, err] = fscanf(fid, "%d", "C");
    for j = 1:num_col
     [data, count, err] = fscanf(fid, "%s", "C");
     InitialMatrix(i, j) = data;
    endfor
  endfor

  fclose(fid);
endfunction