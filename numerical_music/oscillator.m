function x = oscillator(freq, fs, dur, A, D, S, R)
    % Creează un vector de timp
    t = 0:1/fs:dur-1/fs;

    % Creează o undă sinuzoidală
    sin_wave = sin(2 * pi * freq * t);

    % Calculează numărul de eșantioane pentru fiecare parte a anvelopei ADSR
    A_samples = floor(A * fs); % Numărul de eșantioane pentru faza de Attack
    D_samples = floor(D * fs); % Numărul de eșantioane pentru faza de Decay
    R_samples = floor(R * fs); % Numărul de eșantioane pentru faza de Release
    S_samples = length(t) - A_samples - D_samples - R_samples; % Numărul de eșantioane pentru faza de Sustain

    % Generează anvelopa ADSR
    A_env = linspace(0, 1, A_samples); 
    D_env = linspace(1, S, D_samples);
    S_env = ones(1, S_samples) * S;    
    R_env = linspace(S, 0, R_samples);

    % Combinați segmentele anvelopei într-o anvelopă completă
    env = [A_env, D_env, S_env, R_env];

    % Aplică anvelopa la unda sinusoidală
    x = sin_wave .* env; 
    x = x'; 
end
