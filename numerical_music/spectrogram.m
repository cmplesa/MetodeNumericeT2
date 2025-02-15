function [S, f, t] = spectrogram(signal, fs, window_size)
    % iau semnalul si il fac mono
    [signal_length, ~] = size(signal);

    % calculez numarul de ferestre
    num_windows = floor(signal_length / window_size);

    % initializez matricea spectrogram
    S = zeros(window_size, num_windows);

    % initializez vectorul de timp
    t = zeros(num_windows, 1);

    delta_t = window_size / fs;

    f = zeros(window_size, 1);
    for i = 1:window_size
      f(i) = (i - 1) * fs / window_size;
      f(i) = f(i) / 2;
    end
    for i = 1:num_windows
        window_start = (i - 1) * window_size + 1;
        window_end = i * window_size;
        window = signal(window_start:window_end);

        % aplic hann window
        window = window .* hanning(window_size);

        % calculez fft
        window_fft = fft(window, window_size * 2);

        window_fft = window_fft(1:window_size);

        % retin rezultatul in matricea spectograma
        S(:, i) = abs(window_fft);

        % dau update la vectorul de timp
        t(i) = (i - 1) * delta_t;

    end
end
