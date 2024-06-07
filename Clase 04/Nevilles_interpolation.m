function yt = Nevilles_interpolation(x,y,xt,epsilon)
    %nota: valores de x deben ser en columnas%
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

    yt=Q(i,i);

end