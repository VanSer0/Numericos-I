function [I,n,m] = Int_Simpson_2D_adapt(f,a,b,c,d,tol)

    %x está entre a y b
    %y está entre c y d
    
    % n,m son las particiones de x,y
    
    tolt = 1;
    n = 2;
    m = 2;
    It = 0;
    
    tolt = 1;
    
    while tol <= tolt
    
        P0 = 0; %terminos extremos 
        P1 = 0; %terminos impares
        P2 = 0; %terminos pares
        
        for i = 0:n
            hx = (b-a)/n; %partición en x
            x = a+i*hx;
            S0 = f(x,c) + f(x,d);
            S1 = 0;
            S2 = 0;
            for j = 1:m-1
                hy = (d-c)/m;%partición en y
                y = c+j*hy;
                if mod(j,2)==0
                    S2 = S2 + f(x,y);
                else
                    S1 = S1 + f(x,y);
                end
                Iy = (hy/3)*(S0+2*S2+4*S1);
            end
            if (i==0) || (i==n)
               P0=P0+Iy;
            elseif mod (i,2)==0
               P2 = P2 + Iy;
            else
               P1 = P1 + Iy;
            end
        end
        
        I = (hx/3)*(P0+2*P2+4*P1);
        
        tolt = abs(It - I);
        It = I;
        n = n+2;
        m = m+2;

    end
end
