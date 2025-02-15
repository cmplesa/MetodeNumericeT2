function recoms = recommendations(path, liked_theme, num_recoms, min_reviews, num_features)
  # TODO: Get the best num_recoms recommandations similar with 'liked_theme'.
  processed_mat = preprocess(read_mat(path), min_reviews);
  [U S V] = svds(processed_mat, num_features);
  for i = 1:size(V, 1)
   similarity(i) = cosine_similarity(V(i, :)', V(liked_theme, :)');
  endfor
  [vector indices] = sort(similarity, 'descend');
  nr = 1 + (num_recoms);
  recoms = indices(1, 2:nr);
end
