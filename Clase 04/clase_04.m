clearvars;
filename = "absortion_of_pure_water_300_to_800_nm_s.txt";
A = readmatrix(filename);

lambda = A(3:end,1);

K = A(3:end,2);





lambdat = (300:4:800)';

Kk = zeros(size(lambdat));

epsilon = 1e-4;

for i = 1:size(lambdat)

    Kk(i) = Nevilles_interpolation(lambda, K, lambdat(i),epsilon);


end

figure(1);

plot(lambda,K, "ob")
xlabel("\lambda(nm)")
ylabel("K(1/cm)")

hold on;

plot(lambdat,Kk)

hold off


