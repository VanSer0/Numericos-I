clearvars;
clc;

a = 0;
b = 2;
c = 0;
d = 2;


f = @(x,y) 5 - (x.^2 + y.^2);


xx = (-2:0.01:2)';
yy = (-2:0.01:2)';

[X,Y] = meshgrid(xx, yy);

Z = f(X,Y);

figure(1);
surf(X,Y,Z,'FaceAlpha','0.5','EdgeColor','none')


tol = 0.01;

[Iadpt,nn,mm] = Int_Simpson_2D_adapt(f,a,b,c,d,tol);


n = 2;
m = 2;
I= Int_Simpson_2D(f,a,b,c,d,n,m);

F = @(x,y) -(x*y^3)/3 - (x^3*y)/3 + 5*x*y;

Iexact = F(b,d) - F(a,c);