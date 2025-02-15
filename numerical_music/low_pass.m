function signal = low_pass(signal, fs, cutoff_freq)
    % Aplică transformata Fourier pentru a obține spectrul de frecvențe al semnalului
    X = fft(signal);

    % Generează un vector de frecvențe asociate cu componentele spectrului
    f = (0:length(signal)-1) * (fs / length(signal));

    mask = f < cutoff_freq;

    X_filtered = X .* mask';

    % Converteste spectrul filtrat înapoi în domeniul timpului
    signal = ifft(X_filtered);

    signal = signal / max(abs(signal));
end