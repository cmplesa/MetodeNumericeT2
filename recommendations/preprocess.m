function reduced_mat = preprocess(mat, min_reviews)
    % Calculează numărul de recenzii pentru fiecare utilizator (numărul de elemente nenule pe fiecare rând)
    review_counts = sum(mat ~= 0, 2);

    % Identifică utilizatorii care au un număr de recenzii mai mare sau egal cu min_reviews
    valid_users = review_counts >= min_reviews;

    % Selectează doar rândurile din matrice care corespund utilizatorilor validați
    reduced_mat = mat(valid_users, :);
end