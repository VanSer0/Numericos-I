%clase del 4/6/24 Metodo de Runge Kutta
%{
Mejor que otros metodos vistos en clase.
Este metodo utiliza un desarrollo de Taylor en 2D de una integral de
superficie, y se basa en resolver un sistema de ecuaciones para encontrar
los coeficientes de Runge Kutta desde grado 2 hasta grado 4. Nosotros
veremos el grado 4. Para más precisión usar el de grado 8.
%}
clearvars;
%Constantes a utilizar
e = 1.602e-19; %C
m_e = 9.189e-12; %Kg
epsilon_0 = 8.854e-12; %C^2 / N*m^2
%Carga movil 
n = -1;
q = n*e; %electron
%Posición inicial
r0 = [0,0,0];
%Velocidad inicial
v0 = [0,0,0];

N = 10000;
r = zeros(N,3); 
v = zeros(N,3);

%Primera carga fija:
n = -1;
q1 = n*e;
r1 = [0.1,-0.1,0.1]; % 10 cm atrás

%Segunda carga fija:
n = 3;
q2 = n*e;
r2 = [0.2,-0.1,0]; % 10 cm atrás

%Tercera carga fija:
n = -1;
q3 = n*e;
r3 = [0.2,-0.2,0]; % 10 cm atrás

%Cuarta carga fija:
n = 5;
q4 = n*e;
r4 = [0.2,-0.1,1]; % 10 cm atrás
%%%%%%%%%%%%
d1 = r1-r0;
d2 = r2-r0;
d3 = r3-r0;
d4 = r4-r0;
%%%%%%%%%%%


figure(1);
clf(1);
plot3(r0(1),r0(2),r0(3), 'o', 'Color','g','MarkerFaceColor','k')
hold on;
plot3(r1(1),r1(2),r1(3), 'o', 'Color','b','MarkerFaceColor','k')
plot3(r2(1),r2(2),r2(3), 'o', 'Color','r','MarkerFaceColor','k')
plot3(r3(1),r3(2),r3(3), 'o', 'Color','c','MarkerFaceColor','k')
plot3(r4(1),r4(2),r4(3), 'o', 'Color','y','MarkerFaceColor','k')
quiver3(r0(1),r0(2),r0(3), d1(1),d1(2),d1(3),'LineWidth',1.5)
quiver3(r0(1),r0(2),r0(3), d2(1),d2(2),d2(3),'LineWidth',1.5)
quiver3(r0(1),r0(2),r0(3), d3(1),d3(2),d3(3),'LineWidth',1.5)
quiver3(r0(1),r0(2),r0(3), d4(1),d4(2),d4(3),'LineWidth',1.5)
hold off;
grid on;
xlabel('x')
ylabel('y')
zlabel('z')
text(r1(1),r1(2),r1(3),'\leftarrow q_1')
text(r2(1),r2(2),r2(3),'\leftarrow q_2')
text(r3(1),r3(2),r3(3),'\leftarrow q_3')
text(r4(1),r4(2),r4(3),'\leftarrow q_4')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%

E1 = @(r,r1) (1/(4*pi*epsilon_0))*q1*(r-r1)/(dot(r-r1,r-r1))^(3/2);
E2 = @(r,r2) (1/(4*pi*epsilon_0))*q1*(r-r2)/(dot(r-r2,r-r2))^(3/2);
E3 = @(r,r3) (1/(4*pi*epsilon_0))*q1*(r-r3)/(dot(r-r3,r-r3))^(3/2);
E4 = @(r,r4) (1/(4*pi*epsilon_0))*q1*(r-r4)/(dot(r-r4,r-r4))^(3/2);

f = @(r,r1,r2,r3,r4) (q/m_e)*(E1(r,r1)+E2(r,r2)+E3(r,r3)+E4(r,r4)) ;

r(1,:) = r0;
v(1,:) = v0;
ti = 0;
tf = 10e-3;
h = (tf - ti)/N;
for i=1:N
    k1 = h*f(r(i,:),r1,r2,r3,r4);
    k2 = h*f(r(i,:)+(1/2)*k1,r1,r2,r3,r4);
    k3 = h*f(r(i,:)+(1/2)*k2,r1,r2,r3,r4);
    k4 = h*f(r(i,:)+k3,r1,r2,r3,r4);
    v(i+1,:) = v(i) + (1/6).*(k1 + 2.*k2 + 2.*k3 + k4);
    
    k1 = h*v(1,:);
    k2 = h*v(1,:);
    k3 = h*v(1,:);
    k4 = h*v(1,:);

    r(i+1,:) = r(i) + (1/6) * (k1 + 2.*k2 + 2.*k3 + k4);

end

figure(2);
clf(2);
plot3(r0(1),r0(2),r0(3), 'o', 'Color','g','MarkerFaceColor','k')
hold on;
plot3(r1(1),r1(2),r1(3), 'o', 'Color','b','MarkerFaceColor','k')
plot3(r2(1),r2(2),r2(3), 'o', 'Color','r','MarkerFaceColor','k')
plot3(r3(1),r3(2),r3(3), 'o', 'Color','c','MarkerFaceColor','k')
plot3(r4(1),r4(2),r4(3), 'o', 'Color','y','MarkerFaceColor','k')
quiver3(r0(1),r0(2),r0(3), d1(1),d1(2),d1(3),'LineWidth',1.5)
quiver3(r0(1),r0(2),r0(3), d2(1),d2(2),d2(3),'LineWidth',1.5)
quiver3(r0(1),r0(2),r0(3), d3(1),d3(2),d3(3),'LineWidth',1.5)
quiver3(r0(1),r0(2),r0(3), d4(1),d4(2),d4(3),'LineWidth',1.5)
plot3(r(:,1),r(:,2),r(:,3),'-','Color','k','MarkerFaceColor','k')
hold off;
grid on;
xlabel('x')
ylabel('y')
zlabel('z')
text(0,0,0,'\leftarrow t = 0' )
text(r1(1),r1(2),r1(3),'\leftarrow q_1')
text(r2(1),r2(2),r2(3),'\leftarrow q_2')
text(r3(1),r3(2),r3(3),'\leftarrow q_3')
text(r4(1),r4(2),r4(3),'\leftarrow q_4')