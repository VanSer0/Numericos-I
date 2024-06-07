clearvars;
clc;

% Metodo de Euler



f = @(t,y) y - t^2 + 1 ;

t_0 = 0;

N = 1000;

a =0;
b =2;

h = (b-a)/N;

y = zeros(N+1,1);
t = zeros(N+1,1);

y(1) = 1/2;

t(1) = t_0;

for i=1:N-1

    ti =  a + i*h;
    t(i+1) = ti;
 
    y(i+1) = y(i) + h*f(ti,y (i));

end

yexact = @(t) (t+1)^2 - (1/2)*exp(t);

y_exact = zeros(N+1,1);

for i=1:N-1

    y_exact(i) = yexact(t(i));

end

figure(1);

plot(t,y,'ob')
hold on;
plot(t,y_exact,'.r')