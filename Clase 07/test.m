clc;
clearvars;
n = 5000;
a = 0;
b = 0;
I = int_trapesoide(a,b,n);

I_exact = (b*log(b)-b)-(a*log(a)-a);