clearvars;
clc;

a = 0;
b = 1;
c = 0;
d = 1;

f = @(x,y) x^2+y^2;

N = 100000;
V = (b-a) * (d-c);

% x = rand(N,1);
% figure(1)
% plot(x,'ob')

Fi = zeros(N,1);
fi = 0;
for i = 1:N
    x = a + (b-a)*rand(1);
    y = c + (d-c)*rand(1);
    fi = fi + f(x,y);
    Fi(i) = f(x,y);
end

sf = (1/N)*fi;
I = V*sf;

df = 0;
for i=1:N
    df = df + (Fi(i)-sf)^2;
end
dI = (V/sqrt(N))*sqrt((1/(N-1))*df);


F =@(x,y) (x^3*y)/3 + (y^3*x)/3;

I_exact = F(b,d)-F(a,c);
