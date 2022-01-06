%% Exercitiul 1:
P_tan=date_indiv_SS(108);
H=[P_tan.den{1}(2),P_tan.den{1}(4),0;P_tan.den{1}(1),P_tan.den{1}(3),0;0,P_tan.den{1}(2),P_tan.den{1}(4)]
det1=H(1,1);
det2=H;
det2(2,:)=[];  
det2(:,3)=[];
det3=H;
numitor=P_tan.den{1};
poli=roots(numitor);
%% Exercitiul 2:
t=(0:0.01:180)';
h_pondere=impulse(P_tan,t);
rasp_trp=step(P_tan,t);
trp=double(t>=0);
rasp_conv=conv(trp , h_pondere )*0.01;
rasp_conv=rasp_conv(1:18000);
rasp_trp=rasp_trp(1:18000);
norm_dif=norm(rasp_trp-rasp_conv,inf);
%% Exercitiul 3:
x0=[1 1 1];
rasp_tot=lsim(ss_ci(P_tan),trp,t,x0);
rasp_perm=trp*evalfr(P_tan,0);
rasp_tran=rasp_tot-rasp_perm;
plot(rasp_perm);
plot(rasp_tran);
rasp_libr=initial(ss_ci(P_tan),x0,t);
rasp_fort=rasp_tot-rasp_libr;

