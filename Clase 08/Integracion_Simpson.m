function I = Integracion_Simpson(a, b, n)

    %  n debe ser par
    %  a<b

    h = (b-a)/n;

    xx = (a:h:b);
    y = f(xx);
    
    s_0 = f(a) +f(b);
    s_1 = 0;
    s_2 = 0;
    
    for i=1:n-1
        x = a + i*h;
    
        if mod(i,2) == 0
    
            s_2 = s_2 + f(x);
        else
            s_1 = s_1 + f(x);
    
        end
    
    end
    
    I = (h/3)*(s_0+ 2*s_2 + 4*s_1);

end

