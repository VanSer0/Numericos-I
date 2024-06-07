function I = int_trap_adapt(a, b, tol)
    
    tol_i = 1;
    
    h= (b-a);
    x_a = a;
    x_b = a+h;

    I_0 = (h/2)*(f(x_a)+f(x_b));
    I_t = I_0;

    n = 2;

    while (tol <= tol_i)

        h = (b-a)/n;
        s_0 = f(a);
        s = 0;
        s_n = f(b);

        for i=1:n-1
            
            x = a+i*h;
            s = s + f(x);

        end

        I =(h/2)*(s_0 + 2*s + s_n);
        tol_i = abs(I_t-I);
        I_t=I;
        n = n+1;
    end
end

