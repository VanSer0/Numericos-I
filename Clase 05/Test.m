clc;
clearvars;

x = (0:0.5:10)';

y = exp(x);

xt = 2;

yt1 = Piece_wise_Polinomial_function(x,y,xt);

yt = 7.389056098930650;

xt1 = Piece_wise_Polinomial_function(y,x,yt);