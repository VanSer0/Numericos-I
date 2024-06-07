clearvars;
clc;
n=50;
a=1;
b=10;
tol=0.001;

tic
I_t = int_trapesoide(a,b,n);
toc

tic
I_ta = int_trap_adapt(a,b,tol);
toc

tic
I_s = Integracion_Simpson(a,b,n);
toc

tic
I_sa = int_Simpson_adapt(a,b,tol);
toc

I_exact = (b*log(b)-b)-(a*log(a)-a);