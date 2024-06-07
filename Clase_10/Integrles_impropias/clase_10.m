clearvars;
clc;

a = 2;
b = 3;
tol = 0.001;

fint = @G;

In = int_Simpson_Impropia(fint,a,b,tol);

Ia = f(b) - f(a);

Iestimada = In + Ia;

Iexacta = J(b) - J(a);
