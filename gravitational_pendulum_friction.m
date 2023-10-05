% Gravitational pendulum with friction

close all; clear all; clc;


g = 9.8062; % g la paralela 45 (m/s^2)
l = 1.44; % m

w02 = g / l;
t0 = 0;
tf = 25;
steps = 10000;
c = 1;
t = linspace(t0,tf,steps);
dt = t(2) - t(1);

theta = zeros(1,steps);
theta0 = pi / 2;
theta(1) = theta0;
theta(2) = theta0;

for i = 2:steps-1
        theta(i+i) = theta(i-1)*(c*dt - 1) - theta(i)*(c*dt - 2) - dt^2*w02*sin(theta(i));
        if (theta(i+1) < theta(i) && theta(i) > theta(i-1))
                disp(t(i));
        end;
        
end;

figure(1);
plot(t,theta, '-b');
xlabel('t(s)');
ylabel('Unghiul(rad)');
grid;