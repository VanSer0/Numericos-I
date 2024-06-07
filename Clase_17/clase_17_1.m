clearvars;
clc;

e = 1.60217e-19;  % C 
q = e;            % C
m = 6.6464e-27;   % Kg



V1 = 100; %Voltios
V2 = 0;   %Voltios
d = 0.020; %metros

B0 = 0.01;           %Tesla
E0 = (V1-V2)/d;      %V/m

B = B0*[0,0,1];
E = E0*[1,0,0];
%******************

a = @(v,E,B) (q/m) * (E + cross(v,B));

v0 = [0,0,0];
r0 = [0,0,0];

ti = 0;
tf = 10000e-9;

N = 1000;
h = (tf-ti)/N;

t = zeros(N,1);
r = zeros(N,3);
v = zeros(N,3);

t(1) = ti;
r(1,:) = r0;
v(1,:) = v0;

for i=1:N

    t(i+1) = ti + i*h;

    if r(i,1) <= d
        B = [0,0,0];
        E = E0*[1,0,0];
    else
        B = B0*[0,0,1];
        E = [0,0,0];
    end
    v(i+1,:) = v(i,:) + h*a(v(i,:),E,B); 
    r(i+1,:) = r(i,:) + h*v(i,:);

end

figure(1);
plot(t,v(:,1),'.b');
xlabel('t(s)')
ylabel('vx(m/s')

figure(2);
plot(t,v(:,2),'.b');
xlabel('t(s)')
ylabel('vx(m/s')