% Metodo de Taylor
clearvars;
clc;

ti = 0;
tf = 1;
y0 = 1;

df = @(t,y) (2 - 2*t*y) / (t^2 + 1);

ddf = @(t,y) ((6*t^2-2)*y-8*t)/(t^4+2*t^2+1);

dddf = @(t,y) -(((24*t^3-24*t)*y-36*t^2+12)/(t^6+3*t^4+3*t^2+1)); 

ddddf = @(t,y) ((120*t^4-240*t^2+24)*y-192*t^3+192*t)/(t^8+4*t^6+6*t^4+4*t^2+1);

N = 100;

h = (tf-ti)/N;

t = zeros(N,1);
y = zeros(N,1);
ye = zeros(N,1);

t(1) = ti;
y(1) = y0;
ye(1) = y0;

for i=1:N

    t(i+1) = ti + i*h;
    y(i+1) = y(i) + h*df(t(i),y(i)) + (h^2/2)*(ddf(t(i),y(i))) + (h^3/6)*ddf(t(i),y(i))+ (h^4/24)*dddf(t(i),y(i));
    ye(i+1) = y(i) + h*df(t(i),y(i));
end

yf = @(t) (2*t+1)./(t.^2+1);

figure(1);
plot(t,y,'or')

hold on
plot(t,ye,'ko')
plot(t,yf(t),'.b')

