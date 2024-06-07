clearvars;
clc;

n = 10;
a = 1;
b =10;

Imt_trapezoide = int_trapesoide(a,b,n);

Int_Simpson = Integracion_Simpson(a,b,n);

I_exact = (b*log(b)-b)-(a*log(a)-a);