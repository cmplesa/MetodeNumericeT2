function coef = spline_c2(x, y)
    n = length(x) - 1;
    A = zeros(4 * n);
    b = zeros(4 * n, 1);

    row = 1;
    for i = 1:n
        % Setează ecuația pentru spline la punctul x(i) să fie egal cu y(i)
        A(row, (i-1)*4 + 1) = 1;
        b(row) = y(i);
        row = row + 1;

        if i < n
            xi_next = x(i+1) - x(i);
            % Asigură continuitatea spline-ului între segmentele [i] și [i+1]
            A(row, (i-1)*4 + 1:(i-1)*4 + 4) = [1, xi_next, xi_next^2, xi_next^3];
            A(row, i*4 + 1:i*4 + 4) = [-1, 0, 0, 0];
            row = row + 1;

            % Asigură continuitatea primei derivate la punctele de joncțiune
            A(row, (i-1)*4 + 2:(i-1)*4 + 4) = [1, 2*xi_next, 3*xi_next^2];
            A(row, i*4 + 2:i*4 + 4) = [-1, 0, 0];
            row = row + 1;

            % Asigură continuitatea celei de-a doua derivate la punctele de joncțiune
            A(row, (i-1)*4 + 3:(i-1)*4 + 4) = [2, 6*xi_next];
            A(row, i*4 + 3:i*4 + 4) = [-2, 0];
            row = row + 1;
        else
            xi_next = x(n+1) - x(n);
            % Condițiile finale pentru ultimul segment de spline
            A(row, (n-1)*4 + 1:(n-1)*4 + 4) = [1, xi_next, xi_next^2, xi_next^3];
            b(row) = y(n+1);
            row = row + 1;

            A(row, (n-1)*4 + 3:(n-1)*4 + 4) = [2, 6*xi_next];
            b(row) = 0;
            row = row + 1;
        end
    end

    % Condiții de tip 'natural spline' pentru punctul final (a doua derivată = 0)
    A(row, 3) = 2;
    b(row) = 0;
    row = row + 1;

    % Rezolvă sistemul de ecuații liniare pentru a găsi coeficienții spline-ului
    coef = A\b;
end
