clearvars;
filename = "electric_potential.txt";
A = importdata(filename,' ',9);

x = A.data(:,1);
y = A.data(:,2);
V = A.data(:,3);

clear A;

[X,Y] = meshgrid(x,y);
Z = griddata(x,y,V,X,Y);

figure(1);
h = surf(X,Y,Z,'FaceAlpha',0.5);
colormap("jet");
colorbar;
h.EdgeColor = 'none';
h.FaceLighting='gouraud';
