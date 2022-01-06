%Baiceanu Vlad Stefan 321AB tema 2
%ID 107

P_tan = date_indiv_SS(107);
omeg = logspace(-2, 2, 1000)';

figure(1)
hold on
nyquist(P_tan,omeg)
hold off
inters1 = 0.0957;
inters2 = -0.157;

hold on
nyquist(P_tan * 2,omeg)
hold off
inters3 = -0.312;

hold on
nyquist(P_tan * exp(-1i * pi / 4),omeg)
hold off
inters4 = -0.201;

hold on
nyquist(P_tan / tf('s'), omeg)
hold off

asimpt = -0.102;
figure(2)
K_1 = 100 / inters1;
T_1 = 1000;

C_1 = tf(K_1, [T_1 1]);

nyquist(P_tan * C_1,omeg)

figure(3)
K_2 = 100/inters1;
T_2 = 1000;
C_2 = K_2 * tf([1 1], [T_2 1]);

nyquist(P_tan * C_2, omeg);

figure(4)
bode(P_tan, omeg);
[amp1, def1] = bode(P_tan, 1);
amp1 = 7 * amp1;
def1 = def1 + 45;


figure(5)
bode(P_tan * 3, omeg);
[amp2, def2] = bode(P_tan * 3, 1);
amp2 = 7 * amp2;
def2 = def2 + 45;

figure(6)
bode(P_tan * exp(-1i * pi / 6), omeg);
[amp3, def3] = bode(P_tan * exp(-1i * pi / 6), 1);
amp3 = 7 * amp3;
def3 = def3 + 45;

figure(7)
bode(P_tan * 100, omeg);
omeg_1 = 3.63;
omeg_2 = 2.02;

K_3 = 100 / inters1;
w_3 = 0.204;


C_3 = tf (K_3 * w_3, [1 w_3]);
figure(8)
bode(P_tan * C_3, omeg);


A_4 = 1;
B_4 = 4.08;
C_4 = 100 * tf(B_4 * [1 A_4], A_4 * [1 B_4]);
figure(9)
bode(P_tan * C_4, omeg);

save('tema_107.mat', 'inters1', 'inters2', 'inters3', ...
'inters4', 'asimpt', 'K_1', 'T_1', 'K_2', 'T_2', 'amp1', ...
'def1', 'amp2', 'def2', 'amp3', 'def3', 'omeg_1', 'omeg_2', ...
'K_3', 'w_3', 'A_4', 'B_4');