clearvars;
clc;

ti = 0;
tf = 2; %s

x0 = 0.01; %m
v0 = 0; %m/s

k = 2; %N/m
m = 0.010; %Kg

f = @(x) -(k/m)*x ;

N = 10000;

h = (tf-ti)/N;

v = zeros(N+1,1);
x = zeros(N+1,1);
t = zeros(N+1,1);

v(1) = v0;
x(1) = x0;
t(1) = ti;

for i=1:N
    t(i+1) = ti + i*h;

    v(i+1) = v(i) + h * f(x(i));
    x(i+1) = x(i) + h * v(i);
end

figure(1);
plot(t,x,'.b');
xlabel('t(s)')
ylabel('x')

figure(2);
plot(t,v,'.b');
xlabel('t(s)');
ylabel('v')

