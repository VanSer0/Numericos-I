%%
%Derivacin Numerica
%%

function dy = diff_3_points(x, y, h)

    dy = zeros(size(x))';
    
    dy(1) = 1/(2*h)*(-3*y(1)+4*y(2)-y(3)); 
    
    for i=2:size(x,1)-1
    
        dy(i) = (1/(2*h))*(-y(i-1)+y(i+1));
    
    
    end
    
    dy(end) = (1/(2*h))*(y(end-2)-4*y(end-1)+3*y(end));



end