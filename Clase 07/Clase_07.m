%LET'S CODE BITCHES

%Integracion Numerica - Método trapesoidal

clc;
clearvars;

n = 500000;
a = 1;
b = 10;
h= (b-a)/n;


x = (a:h:b);

y = log(x);


figure(1)
plot(x,y,'ob');
% ************************

s_0 = y(1); %f(a)
s =  0;
s_n = y(end);

for i=1:n-1

    xx = a + i*h;
    s = s + y(i+1);

end 

I_num = (h/2)*(s_0 + 2*s + s_n);


% ***********************************


I_exac =(x(end)*log(x(end))-x(end)-(x(1)*log(x(1))-x(1)));

format long
I_num



