function I = int_trapesoide(a,b,n)
   h= (b-a)/n;

   s_0 = f(a);
   s = 0;
   s_n = f(b);

   for i=1:n-1
        x = a + i*h;
        s = s + f(x);

   end 
    
   I =(h/2)*(s_0 + 2*s + s_n);
end