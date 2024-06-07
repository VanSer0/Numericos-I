%Polinomios de Lagrange: encontrar puntos entre puntos%

clearvars;

x= (1:0.5:100)';
y= 1./x;

figure(1);

plot(x,y, "ob");
xlabel('x');
ylabel('y');

xt=50.32432; %encontrar el yt para el xt%

Lk = zeros(size(x));

L=1;

for k = 1:size(x,1)

    for i =1:size(x,1)

        if x(i) ~=x(k)

            Lt = (xt-x(i))/(x(k)-x(i));
            L = L*Lt;

        end

    end

    Lk(k) = L; L=1;

end



yt = 0;
for i =1:size(y,1)
    yt = y(i)*Lk(i)+yt;
end

dif = -(1/xt-yt);



figure(2);

plot(x,Lk,'-b');