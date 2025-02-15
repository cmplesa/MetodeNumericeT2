function [x, y] = parse_data(filename)
    % file input format:
    % n
    % x0 x1 ... xn
    % y0 y1 ... yn

    % TODO 1: Deschide fișierul pentru citire
    fileID = fopen(filename, 'r');

    % TODO 2: Citește n, x, y din fișier
    n = fscanf(fileID, '%d', 1); % Citeste numarul de elemente
    x = fscanf(fileID, '%f', n+1); % Citeste vectorul x
    y = fscanf(fileID, '%f', n+1); % Citeste vectorul y

    % TODO 3: Închide fișierul
    fclose(fileID);
end

