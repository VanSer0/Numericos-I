%%
%Derivacin Numerica
%%

function dy = diff_5_points(x, y, h)

    dy = zeros(size(x))';
    
    dy(1) = 1/(12*h)*(-25*y(1)+48*y(1+1)-36*y(1+2)+16*y(1+3)-3*y(1+4));
    dy(2) = 1/(12*h)*(-25*y(2)+48*y(2+1)-36*y(2+2)+16*y(2+3)-3*y(2+4));
    
    for i=3:size(x,1)-2
    
        dy(i) = (1/(12*h))*(y(i-2)-8*y(i-1)+8*y(i+1)-y(i+2));
    
    
    end
    
    dy(end) = 1/(12*h)*(-25*y(end)+48*y(end-1)-36*y(end-2)+16*y(end-3)-3*y(end-4));
    dy(end-1) = 1/(12*h)*(-25*y(end-1)+48*y(end-1-1)-36*y(end-1-2)+16*y(end-1-3)-3*y(end-1-4));



end