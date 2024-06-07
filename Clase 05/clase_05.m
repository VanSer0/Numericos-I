clc;
clearvars;

%Piece-wise Polinomial approximation | Grado 3
%Spline en matlab

x = (0:1:5)';
y = exp(x);

a=zeros(size(x));
b=zeros(size(x,1)-1,1);
d=zeros(size(x,1)-1,1);
h=zeros(size(x,1)-1,1);
g=zeros(size(x));
A=zeros(size(x,1),size(x,1));

for i=1:size(x,1)
    a(i)=y(i);
end

for i=1:size(x,1)-1
    h(i)=x(i+1)-x(i);
end

A(1,1) = 1;
A(size(x,1),size(x,1)) = 1;

for i=2:size(x,1)-1
    A(i,i+1)=h(i);
end

for i=2:size(x,1)-1
    A(i,i)=2*(h(i-1)+h(i));
end

for i=2:size(x,1)-1
    A(i,i-1)=h(i-1);
end

g(1)=0;
g(size(x,1))= 0;

for i=2:size(x,1)-1
    g(i)=(3/h(i))*(a(i+1)-a(i))-(3/h(i-1))*(a(i)-a(i-1));
end

C = A\g;

for i=1:size(x,1)-1
    b(i)=(1/h(i))*(a(i+1)-a(i))-(h(i)/3)*(2*(C(i))+C(i+1));
    d(i)= (1/3*h(i))*(C(i+1)-C(i));
end

xt = 0.5;

for j=1:size(x,1)-1

    if (x(j) <= xt) && (xt <= x(j+1))

        yt = a(j) + b(j)*(xt-x(j)) + C(j)*(xt-x(j))^2 + d(j)*(xt-x(j))^3;

    end
end



%AC = g%

figure(1);
hold on;
plot(x,y);
plot(xt,yt, "ob")

