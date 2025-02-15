function signal = apply_reverb(signal, impulse_response)
    % Asigură că răspunsul la impuls este în format mono
    impulse_response = stereo_to_mono(impulse_response);

    % Calculează convoluția între semnalul audio și răspunsul la impuls
    signal = fftconv(signal, impulse_response);

    % Normalizează semnalul rezultat pentru a avea o amplitudine maximă de 1
    signal = signal / max(abs(signal));
end
