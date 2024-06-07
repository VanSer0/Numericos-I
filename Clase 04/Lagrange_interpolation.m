%Polinomios de Lagrange: encontrar puntos entre puntos%

%function yt = Lagrange_interpolation(x,y,xt)


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