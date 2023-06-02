function [Y, InitialMatrix] = parse_csv_file(file_path)
  fid = 0;

  % Deschide fisierul
  while fid < 1
    [fid, mesaj] = fopen(file_path, "r");
    if fid == -1
      disp(mesaj);
    endif
  endwhile

  % Declara matricea InitialMatrix de tip cell (matrice se string-uri)
  InitialMatrix = {};

  % Citeste datele din fisier
  data = textscan(fid, '%s', 'Delimiter', ',', 'headerlines', 1);
  fclose(fid);

  % Stabileste numarul de randuri si de coloane
  num_col = 13;
  num_row = length(data{1}) / num_col;

  % Populeaza matricea InitialMatrix
  for i = 1:num_row
    for j = 1:num_col
      InitialMatrix(i,j) = data{1}(num_col * (i-1) + j);
    endfor
  endfor

  % Prima linie din InitialMatrix este transferata in Y
  Y = str2double(InitialMatrix(:,1));
  InitialMatrix = InitialMatrix(:, 2:num_col);
endfunction