clc;
clearvars;

x= (1:0.5:100)';
y= 1./x;

xt=50.32432;


epsilon = 1e-3;

yt = Nevilles_interpolation(x,y,xt,epsilon);


