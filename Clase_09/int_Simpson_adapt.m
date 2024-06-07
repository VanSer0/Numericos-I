function I = int_Simpson_adapt(a,b,tol)

    toli = 1;
    h = (b-a);
    xa = a;
    xb = a+h;

    I_0 = (h/2)*(f(xa)+f(xb));
    I_t = I_0;

    n = 2; 

    while tol <= toli

        h = (b-a)/n;
    
        s_0 = f(a) + f(b);
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
        toli = abs(I_t-I);
        I_t=I;
        n = n+2;

    end
end

