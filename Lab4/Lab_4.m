H = tf(1,[1. 0 1]) 

t = 0:0.01:20;
u = sin(2*t);
%%lsim(H,sin(2*t),2*t)
[mag,def] = bode(H,2)
%%bode(H)
mag2db(mag);

omega = logspace(-3,3,1e4);
bode(H)
db2mag(-60);














