clearvars;
clc;

N = 1000;

R = 0.010; %metros
d = 0.0005; %fuck yeah bitch (en metros)

t = 2*pi*rand(N,1);

tp = 2*pi*rand(N,1);

er = @(t) [cos(t), sin(t), 0];

erp = @(tp) [cos(tp),sin(tp),0];

etp = @(tp) [-sin(tp),cos(tp),0];

k = [0,0,1];

f = @(t,tp) dot(cross(etp(tp),er(t)),k);

a = zeros(N,1);

for i=1:N
    
   a(i) = f(t(i),tp(i));

end

figure(1);

plot(a,'ob')

r = (R-d)*rand(N,1);

figure(2);

plot(r,'ob')

x = r.*cos(t);
y = r.*sin(t);

figure(3);
plot(x,y,'og')

g = @(t,tp) dot(er(t),erp(tp));


b = zeros(N,1);

for i=1:N
    
   b(i) = g(t(i),tp(i));

end


xx = (R-d)*rand(N,1);

yy = (R-d)*rand(N,1);


figure(3);
plot(x,y,'og')
hold on;
plot(xx,yy,'or');
hold off;
