clearvars;
filename = "two_signals.csv";
A = readmatrix(filename);
n = A(:,1);  

dt = 2.0e-9; %valor del tiempo discreto%
t= n*dt;


V_C1 = A(:,2);
V_C2 = A(:,3);

%% %%
figure(1);
plot(t,V_C1);
xlabel("Time (s)");
ylabel("Voltage (V) \Delta \phi");

%% %%
figure(2);
plot(t,V_C2);
xlabel("Time (s)");
ylabel("Voltage (V) \Delta \phi");

%% %%
figure(3);
plot(t,V_C1,'.g');
hold on;
plot(t,V_C2);
hold off;
xlabel("Time (s)");
ylabel("Voltage (V) \Delta \phi");