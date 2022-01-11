

P_tan = date_indiv_SS(107);

H = [1.504 3.821 0; 1 4.09 0; 0 1.504 3.821] 
        
det1 = [1.504];
det2 = [1.504 3.821; 1 4.09];
det3 = [1.504 3.821 0; 1 4.09 0; 0 1.504 3.821];

d1 = det(det1);
d2 = det(det2);
d3 = det(det3);

numitor = [1 1.504 4.09 3.821];

poli = roots(numitor);

%%__________________Ex 2_____________________
t = (0:0.01:180)';

h_pondere = impulse(P_tan, t);
rasp_trp = step(P_tan, t);
trp = double(t >= 0);

rasp_conv = conv(trp, h_pondere) * 0.01;
rasp_trp = rasp_trp(1:18000);
rasp_conv = rasp_conv(1:18000);

f1 = figure('Name','rasp_conv','NumberTitle','off');
plot(rasp_conv);
norm_dif = norm(rasp_trp - rasp_conv, inf);


%%__________________Ex 3_____________________
x0 = [1 1 1];
rasp_tot = lsim(ss_ci(P_tan), trp, t, x0);
rasp_perm = evalfr(P_tan,0) * trp;

rasp_tran = rasp_tot - rasp_perm;

f2 = figure('Name','rasp_perm rasp_tran','NumberTitle','off');
hold on
plot(rasp_perm,'color','r');
plot(rasp_tran,'color','b');
hold off

rasp_libr = initial(ss_ci(P_tan), x0, t);
rasp_fort = rasp_tot - rasp_libr;

f3 = figure('Name','rasp_liber rasp_fort','NumberTitle','off');
hold on
plot(rasp_libr,'color','b');
plot(rasp_fort,'color','m'); 
hold off

%%__________________Ex 4_____________________
Step1 = stepinfo(ss_ci(P_tan))

tc1 = Step1.RiseTime; 
tt1 = Step1.SettlingTime;
tv1 = Step1.PeakTime;
sr1 = Step1.Overshoot;

P_aux = tf(1,[10 1]);

Step2 = stepinfo(ss_ci(P_tan) * P_aux)

tc2 = Step2.RiseTime;
tt2 = Step2.SettlingTime;
tv2 = Step2.PeakTime;
sr2 = Step2.Overshoot;

Step3 = stepinfo(ss_ci(P_tan) * (tf('s')+1))

tc3 = Step3.RiseTime;
tt3 = Step3.SettlingTime;
tv3 = Step3.PeakTime;
sr3 = Step3.Overshoot;

save('tema_107.mat', 'H', 'det1', 'det2', ...
'det3', 'poli', 'h_pondere', 'rasp_trp', 'rasp_conv', ...
'norm_dif', 'rasp_tot', 'rasp_perm', 'rasp_tran', ...
'rasp_libr', 'rasp_fort', 'tc1', 'tt1', 'tv1', 'sr1', ...
'tc2', 'tt2', 'tv2', 'sr2', 'tc3', 'tt3', 'tv3', 'sr3');




