s = tf('s');
H = 1/(s - 2);
nyquist(H);
N = 1;
G = 250*N / s/(10*0.006*s + 10*0.0706) / (10*s + 100)
nyquist(G)
T = feedback(G, 1);
step(T)