%********
%Interpolacion por el metodo dspline
%********

clearvars;
clc;
filename = "absortion_of_pure_water_300_to_800_nm_s.txt";
A = readmatrix(filename);

lambda = A(3:end,1);

K = A(3:end,2);

lambdat = (300:4:800)';

Kk = zeros(size(lambdat));


for i=1:size(lambdat,1)

    Kk(i) = Piece_wise_Polinomial_function(lambda,K,lambdat(i));

end

figure(1)
plot(lambda,K,'ob');
hold on;
plot(lambdat,Kk,'.r');
hold off;
ylabel('k(1/cm)');
xlabel('\lambda (nm)');