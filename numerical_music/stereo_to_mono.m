function mono = stereo_to_mono(stereo)
  % Get the number of rows (samples) and channels of the stereo signal
    mono = mean(stereo, 2);
    % Normalize the mono signal
    mono = mono / max(abs(mono));
endfunction
