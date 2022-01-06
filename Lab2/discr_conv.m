function y=discr_conv(h,u,M)
% discr_conv.m
% y este produsul de convolutie dintre h si u.
% M este un vector de intregi,
% cu semnificatia orizontului de timp.
clc;
for i=1:length(M)
disp('Orizontul de timp este:')
-M(i)
M(i)
for n=1:M(i)
y(n)=0;
for j=-M(i):M(i)
y(n)=y(n)+feval(h,(n-j))*feval(u,j);
end
end
y
figure;
stem(y);
disp('Apasati orice tasta!');
pause;
end
