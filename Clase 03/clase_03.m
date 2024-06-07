%Interpolación por el método de Nevilles%
clc;
clearvars;
x = (0:0.1:1)';
y=exp(x);


figure(1);
plot(x,y,'ob');

xt= 0.05;

epsilon = 1e-3;

Q=zeros(size(x,1),size(x,1));

Q(:,1)=y(:);

for i = 2:size(x,1)

    for j=2:i

        Q(i,j) = ( ((xt-x(i-j+1))*Q(i,j-1)) - ((xt - x(i)) * Q(i-1,j-1)) )/ (x(i) - x(i-j+1));

    end

    if abs(Q(i,j)-Q(i-1,j-1)) < epsilon
        break;
    end

end

yt = exp(xt);
yt1 = Q(i,i);













