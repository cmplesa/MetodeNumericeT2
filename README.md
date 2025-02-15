# TEMA 2 - 2024 MN

## TASK 1

### Stereo to Mono
    Funcția stereo_to_mono convertește un semnal audio stereo în mono prin calcularea mediei celor două canale (stânga și dreapta) pentru fiecare eșantion, rezultând un singur canal. 

### Spectogram

    # PLAIN LOOP vs PLAIN SOUND

    Sunetele reprezentate în primul spectrogram sunt probabil monotone sau foarte controlate, fără multe variații în timbru sau intensitate.
    Sunetele în al doilea spectrogram sugerează o complexitate mai mare, posibil datorită suprapunerii mai multor sunete sau a unui sunet cu caracteristici dinamice și texturale variate.

    # PLAIN SOUND VS LOW PASS

    Primul spectrogram arată frecvențe concentrate la intervale specifice, cu prezența clară a unor tonuri pure pe durata întregii perioade. Aceasta indică un sunet periodic și repetitiv, posibil tonuri generate sintetic.

    Al doilea spectrogram reflectă un spectru mult mai larg și uniform distribuit pe frecvențe joase, cu o atenuare vizibilă a componentelor de frecvență înalte. (low pass function)

    # PLAIN SOUND vs REVERB

    Primul spectrogram reprezintă sunete cu frecvențe fixe și stabile, ideal pentru semnale de test sau muzică cu tonuri pure. Al doilea spectrogram indică un sunet dinamic cu modificări frecvente ale înălțimii tonului, sugerând o complexitate mai mare și un caracter evolutiv al sunetului.

    # TECH

    Această spectrogramă arată un sunet cu modulație de frecvență rapidă, asemănător unui model de "dinte de ferăstrău", unde fiecare segment începe de la o frecvență joasă și crește rapid spre o frecvență înaltă. Culorile de la roșu la albastru indică o variație de intensitate a sunetului de-a lungul frecvențelor. Aceste caracteristici sunt tipice pentru sunetele electronice sau efectele sonore, având o structură ritmică și periodicitate clară.

    # LOW PASS TECH

    Această spectrogramă afișează un semnal audio caracterizat printr-o distribuție constantă a frecvențelor înalte peste întregul interval de timp, cu o intensitate sonoră concentrată în frecvențele joase, indicând o posibilă aplicare a unui filtru trece-jos. Culorile calde la baza spectrului reflectă zone cu energie acustică înaltă în frecvențele joase, în timp ce albastrul predominant în zonele superioare sugerează prezența, dar cu o intensitate redusă, a frecvențelor înalte.

    # REVERB TECH

    Această spectrogramă arată un semnal audio cu efect de reverberație. Se observă impulsuri de sunet care se repetă și atenuează progresiv, caracteristic pentru sunetele reflectate într-un spațiu închis. 

    # LOW PASS REVERB TECH

    Această spectrogramă arată un semnal audio care prezintă o scădere graduală a frecvenței peste timp, vizibilă în conul albastru care se lărgește de la dreapta spre stânga. Aceasta sugerează un efect de "glissando" invers, unde frecvența unui ton scade progresiv. 

    # REVERB LOW PASS

    Această spectrogramă ilustrează un semnal audio constant pe durata timpului, cu o densitate mare de energie în frecvențele joase, indicată prin culorile intense de la baza spectrului. Variația graduală de la roșu la albastru sugerează o atenuare a frecvențelor înalte, posibil datorată aplicării unui filtru trece-jos. Absența

### Oscillator

    Funcția oscillator generează un oscilator sinuzoidal cu o anvelopă ADSR (Attack, Decay, Sustain, Release) specificată. În această funcție, timpul este divizat în segmente corespunzătoare fiecărei faze a anvelopei ADSR, iar amplitudinea fiecărei faze este scalată conform parametrilor A, D, S, R, apoi aplicată pentru a modula amplitudinea undei sinusoidale de bază.

### Low Pass

    Funcția low_pass este destinată filtrării unui semnal audio prin aplicarea unui filtru low-pass în domeniul frecvenței. Procesul începe cu transformarea Fourier (FFT) a semnalului de intrare pentru a-l converti din domeniul timpului în domeniul frecvenței. Se creează un vector de frecvențe f și se definește o mască logică care permite trecerea frecvențelor sub o frecvență de tăiere specificată (cutoff_freq), blocând celelalte frecvențe. Semnalul este apoi filtrat prin înmulțirea spectrului său Fourier cu această mască, iar semnalul filtrat este obținut prin aplicarea transformatei Fourier inverse (IFFT). La final, semnalul filtrat este normalizat pentru a avea amplitudinea maximă egală cu 1, menținând astfel consistența nivelului de amplitudine al semnalului de ieșire. 

### APPLY REVERB

    Funcția apply_reverb aplică efectul de reverb la un semnal audio folosind răspunsul impulsului specificat. Inițial, funcția asigură că răspunsul la impuls este în format mono, convertindu-l dacă este necesar. Apoi, folosește convoluția pentru a combina semnalul audio cu răspunsul la impuls, simulând astfel cum ar răsuna semnalul într-un mediu fizic dat (reprezentat de răspunsul la impuls).


## TASK 2

### PARSE DATA

    Funcția parse_data deschide un fișier specificat prin filename, citește un număr de elemente n și apoi citește două vectori de date x și y de lungime n+1 din acest fișier. La final, închide fișierul și returnează vectorii x și y.

### SPLINE C2

    Funcția spline_c2 calculează coeficienții pentru un spline cubic natural care interpolează un set de puncte (x, y). Folosind metoda matricială, ea construiește un sistem de ecuații liniare unde fiecare segment de spline între două puncte consecutive este reprezentat de patru coeficienți: a,b,c,da,b,c,d. Funcția impune condiții la fiecare punct pentru ca spline-ul să treacă prin fiecare punct dat, să aibă continuitate, și să fie continuu în prima și a doua derivată. La capete, condiționează ca a doua derivată să fie zero (condiții de spline natural). Sistemul de ecuații este apoi rezolvat pentru a obține coeficienții spline-ului, permițând evaluarea spline-ului la orice alt punct din intervalul acoperit de x. 

### P SPLINE

    Funcția P_spline evaluează un spline cubic la punctele specificate în x_interp, folosind coeficienții spline-ului (coef) și punctele inițiale (x) pentru a calcula valorile interpolate (y_interp). Fiecare coeficient din vectorul coef corespunde coeficienților a,b,c,d pentru ecuațiile cubice care definesc spline-ul între fiecare pereche de puncte consecutive din x. Pentru fiecare punct din x_interp, funcția determină intervalul corespunzător din x în care se încadrează punctul și aplică formula spline-ului cubic specific acelui interval pentru a calcula valoarea interpolată. Astfel, se obține un vector y_interp care conține valorile spline-ului la toate punctele din x_interp.

### Vandermonde
    
    Funcția vandermonde calculează coeficienții unui polinom folosind interpolarea Vandermonde. Aceasta creează o matrice Vandermonde inversată din vectorul x, apoi rezolvă sistemul de ecuații liniare cu y pentru a determina coeficienții polinomului care se potrivește exact cu punctele date.

### P Vandermonde

    Funcția P_vandermonde evaluează un polinom definit de coeficienții coef la punctele specificate în vectorul x_interp.

## Task 3

### READ MAT

    Funcția read_mat citește o matrice dintr-un fișier CSV specificat prin calea path. Aceasta folosește funcția csvread pentru a încărca datele în matrice, începând de la al doilea rând și a doua coloană ale fișierului CSV (indexate de la 1 în MATLAB, datorită parametrilor 1 și 1 pasati funcției).

### PREPROCESS

    Funcția preprocess în MATLAB preprocesează o matrice mat care conține recenzii, eliminând utilizatorii cu un număr insuficient de recenzii. În primul pas, calculează numărul de recenzii ale fiecărui utilizator prin sumarea elementelor non-zero de pe fiecare rând (review_counts = sum(mat ~= 0, 2)). 

### Cosine Similarity

    Funcția cosine_similarity calculează similaritatea cosinus între două vectori, A și B. Începe prin normalizarea fiecărui vector la norma unitară, apoi calculează produsul scalar între vectorii normalizați. Similaritatea cosinus, care este produsul scalar divizat prin produsul normelor celor doi vectori (care vor fi 1 datorită normalizării), este returnată ca măsură a gradului de aliniere sau similitudine între A și B.

### Recommendations

    Funcția recommendations generează recomandări pe baza unui set de date citit dintr-un fișier, utilizând analiza semantică latentă (Singular Value Decomposition - SVD) pentru a identifica teme similare. Inițial, datele sunt preprocesate pentru a elimina utilizatorii cu un număr insuficient de recenzii. Apoi, funcția aplică SVD pentru a reduce dimensiunea datelor la un număr specificat de caracteristici (num_features). Se calculează similaritatea cosinus între fiecare temă și tema preferată (liked_theme), urmată de sortarea temelor în funcție de gradul lor de similaritate.