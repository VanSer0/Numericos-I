clearvars;
clc;

g = 9.79;

f = @() [0,-g];

ti = 0;
tf = 1.4;

r0 = [0,0];

vm = 10;

theta = pi/4;

v0 = vm*[cos(theta),sin(theta)];

N = 10000;

h = (tf-ti)/N;

t = zeros(N+1,1);
v = zeros(N+1,2);
r = zeros(N+1,2);

v(1,:) = v0;
r(1,:) = r0;

for i=1:N

    t(i+1) = ti + i*h;

    v(i+1,:) = v(i,:) + h*f();
    r(i+1,:) = r(i,:) + h*v(i,:);

end


figure(1);
plot(t,r(:,1),'.b');
xlabel('t(s)')
ylabel('rx')

figure(2);
plot(t,v(:,1),'.b');
xlabel('t(s)');
ylabel('vx')

figure(3);
plot(t,r(:,2),'.b');
xlabel('t(s)')
ylabel('ry')

figure(4);
plot(t,v(:,2),'.b');
xlabel('t(s)');
ylabel('vy')

figure(5);
plot(r(:,1),r(:,2),'.r');
xlabel('x');
ylabel('y')