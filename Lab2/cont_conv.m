function y=cont_conv(h,u,N)
% cont_conv.m
%N este vectorul cu numarul de puncte al diviziunii
M=10; %orizontul de timp
l=(2*M)./N ;% lungimea intervalului de esantionare
x=0.1:0.1:M;
for i=1:length(N)
    disp('Numarul de puncte al diviziunii este:')
    N(i)
for t=0.1:0.1:M
    y(round(t*10))=0;
    j=-M;
while(j<=M)
    y(round(t*10))=y(round(t*10))+feval(h,(t-j))*feval(u,j);
    j=j+l(i);
end
end
figure;
y=y*l(i);
plot(x,y);
disp('Apasati orice tasta!');
pause;
end
