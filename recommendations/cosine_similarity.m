function similarity = cosine_similarity(A, B)
    norm_A = A / norm(A);
    norm_B = B / norm(B);

    similarity = dot(norm_A, norm_B);
end
