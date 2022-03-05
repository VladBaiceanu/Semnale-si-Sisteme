s = tf('s')
H = 8/(s*(s+1)*(s+2))
% nyquist(H);
F = 4/(s*(s+1)*(s+2))
nyquist(F)
% omega = 0:0.01:1
% %%nyquist(H,omega)
% [R,I] = nyquist(H,omega)
% R = squeeze(R);
% I = reshape(I,length(omega),1);
% %%plot(R,I);
% %%plot(R,I,R,-I);
% H = (-0.5)/(s+1);
% nyquist(H,5*H);
% nyquist(H,0.69*H);
% nyquist(H,11*H);
% help atan2
% nyquist(H,H*(1+i)/sqrt(2));