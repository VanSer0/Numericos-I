clearvars;
clc;

a = 0;
b = 2;
c = @(x) (1/2) * x.^2;
d = @(x)  x;

xx = (-2:0.01:2)';
yy = (-2:0.01:2)';

f = @(x,y) 5-x.^2-y.^2;

[X,Y] = meshgrid(xx,yy);

Z = f(X,Y);

yc = c(xx);
yd = d(xx);

z = [-3 5];
nz = length(z);

X1 = xx*ones(1,nz);
Y1 = yc*ones(1,nz);
Z1 = ones(length(X1),1)*z;

Y2 = yd*ones(1,nz);


figure (1)

surf(X,Y,Z,'FaceAlpha',0.5,'EdgeColor','none');
hold on;
surf(X1,Y1,Z1,'FaceAlpha',0.5,'EdgeColor',['green']);
surf(X1,Y2,Z1,'FaceAlpha',0.5,'EdgeColor','blue');

hold off;
xlabel('x');
ylabel('y');
zlabel('z');


I = Int_Simpson_2D_adapt(f,a,b,c,d,0.01);

F = @(x) (5*x^7+84*x^5-280*x^4-700*x^3+2100*x^2)/840;
I_exact = F(b)-F(a);





