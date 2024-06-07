clc;
clearvars;
x=(0:0.1:1)';
y=exp(x);
xt=1;
epsilon = 1e-3;

yt = Nevilles_interpolation(x,y,xt,epsilon);

K1 = Nevilles_interpolation(1, 2, 3,4);


