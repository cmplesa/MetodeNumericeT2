function mat = read_mat(path)
    % Read the matrix from the CSV file
    mat = csvread(path, 1 , 1);

end
