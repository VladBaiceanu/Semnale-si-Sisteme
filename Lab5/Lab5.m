s = tf('s')
P = 1/(s-1)
N = 1/(s+1)
M = (s-1)/(s+1)
X = 4/(s+1)
Y = (s+3)/(s+1)
Q = (s+3)/(s+1)
% tf(ss (N*X + M*Y, 'min'))  
C = tf(ss((X + M*Q)/(Y - N*Q), 'min'))
aux = tf(ss(1 + P*C, 'min'));
roots(aux.num{1});
P1 = feedback(P*C, 1)
step(P1)
T2 = feedback(P, C)
step(T2)