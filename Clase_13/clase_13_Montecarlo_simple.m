clearvars;
clc;

a = 0;
b= 1;

f = @(x) x.^2;

N = 100000;
V = b-a;

% x = rand(N,1);
% figure(1)
% plot(x,'ob')

Fi = zeros(N,1);
fi = 0;
for i = 1:N
    x = a + (b-a)*rand(1);
    fi = fi + f(x);
    Fi(i) = f(x);
end

sf = (1/N)*fi;
I = V*sf;

df = 0;
for i=1:N
    df = df + (Fi(i)-sf)^2;
end
dI = (V/sqrt(N))*sqrt((1/(N-1))*df);


F =@(x) x^3/3;

I_exact = F(b)-F(a);
