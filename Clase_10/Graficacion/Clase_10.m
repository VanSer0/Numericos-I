clearvars;
clc;
x = (0:0.01:3);
y = (0:0.01:3);

[X,Y] = meshgrid(x,y);

Z = f(X,Y);

figure(1);
surf(X,Y,Z,"FaceAlpha",0.5);