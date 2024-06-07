clearvars;
clc;

R = 1;
Theta = 2*pi;

N = 1000;

r = R^2 * rand(N,1);
theta = Theta * rand(N,1);


figure (1)
plot(r,'ob');

figure (2)
plot(theta,'or');

x = sqrt(r).*cos(theta);
y= sqrt(r).*sin(theta);

figure (3)
plot(x,y,'ob');