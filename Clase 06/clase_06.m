%%
%Derivacion Numerica 3 pts
%%

clearvars;
clc;

h=0.1;
x = (1:h:10)';
y = log(x);

dy3 = diff_3_points(x,y,h);

dy5 = diff_5_points(x,y,h);

yy = 1./x;




figure(1)
%plot(x,y,'.b');
hold on;
plot(x,dy5,'.b');
plot(x,dy3,'or');
%plot(x,yy,'-g');
hold off;



