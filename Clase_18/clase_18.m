clearvars;
clc;



    e = 1.60217e-19;  % C 
    q = e;            % C
    m = 6.6464e-27;   % Kg
    
    
    
    V1 = 100; %Voltios
    V2 = 0;   %Voltios
    d = 0.020; %metros
    
    B0 = 0.1;           %Tesla
    E0 = (V1-V2)/d;      %V/m
    
    B = B0*[0,0,1];
    E = E0*[1,0,0];
    %******************
    
    a = @(v,E,B,m) (q/m) * (E + cross(v,B));
    
    v0 = [0,0,0];
    r0 = [0,0,0];
    
    ti = 0;
    tf = 50e-6;
    
    N = 1000000;
    h = (tf-ti)/N;
    

    mm = m*[1,2,3,4];
    colors = ['b','r','g','k'];
    
    figure (555);
    hold on;
    
for j=1:size(mm,2)
 
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
        v(i+1,:) = v(i,:) + h*a(v(i,:),E,B,mm(j)); 
        r(i+1,:) = r(i,:) + h*v(i,:);
    
        if (v(i,1)<0)&&(r(i,1)<=d)
            break;
        end
    end
    
    % figure(1);
    % plot(t,v(:,1),'.b');
    % xlabel('t(s)')
    % ylabel('vx(m/s')
    % 
    % figure(2);
    % plot(t,v(:,2),'.b');
    % xlabel('t(s)')
    % ylabel('vy(m/s')
    % 
    % figure (3);
    % plot(t,r(:,1),'.b')
    % xlabel('t(s)')
    % ylabel('x(m/s')
    % 
    % figure (4);
    % plot(t,r(:,2),'.b')
    % xlabel('t(s)')
    % ylabel('y(m/s')
    
    plot(r(:,1),r(:,2), '.','Color',colors(j))
    xlabel('x(s)')
    ylabel('y(m/s')

end