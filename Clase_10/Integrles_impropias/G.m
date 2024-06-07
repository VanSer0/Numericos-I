function y = G(x)

    P4 = log(2)+(x-2)/2-(x-2)^2/8+(x-2)^3/24-(x-2)^4/64;

    if (x ==2)
        y = 0;
    else
        y = (log(x)-P4)/sqrt(x-2);
    end

end