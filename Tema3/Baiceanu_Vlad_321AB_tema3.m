[~, P_gir] = date_indiv_SS(107);
a1 = 3.5;
[X,Y,N,M] = eucl_Youla(P_gir.num{1}, P_gir.den{1}, a1);
Q1 = tf(1, [3 2]);

C1 = ( X + M * Q1) / ( Y - N * Q1);
C1 = tf(ss(C1, 'min'));
T1 = P_gir * C1/(1 + P_gir * C1);
T1 = tf(ss(T1, 'min'));
zero(1 + P_gir * C1)

stepinfo(T1)

a2 = 4;
[X2,Y2,N2,M2] = eucl_Youla(P_gir.num{1}, P_gir.den{1}, a2);

Q2 = tf(evalfr(Y2, 0) / evalfr(N2, 0), [10 1]);
C2 = ( X2 + M2 * Q2) / ( Y2 - N2 * Q2);
C2 = tf(ss(C2, 'min'));
T2 = (P_gir * C2) / (1 + P_gir * C2);
T2 = tf(ss(T2, 'min'));
stepinfo(T2)
pole(C2)
save('tema_107.mat' , 'a1' , 'Q1', 'a2'  , 'Q2' );