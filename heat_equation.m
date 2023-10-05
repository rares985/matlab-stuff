%1 = Al
%2 = Otel

close all; clear all; clc;

l1 = 0.2;
l2 = 0.05;

lambda1 = 210;
lambda2 = 46;

ro1 = 2700;
ro2 = 7800;

c1 = 900;
c2 = 490;

d1 = lambda1/ro1/c1;
d2 = lambda2/ro2/c2;

T10 = 800;
T20 = 100;


Nx = 100;
xs = -l1;
xd = l2;
x = linspace(xs,xd,Nx);
dx = x(2) - x(1);

t0 = 0;
tf = 200;
Nt = 20000;
t = linspace(t0,tf,Nt);
dt = t(2) - t(1);

T0 = T10 * ones(1,Nx);
T0(x>0) = T20;

d = d1*ones(1,Nx);
d(x>0) = d2;


T = T0;
Film = moviein(Nt-1);
figure(1);
for i = 2: Nt
        Tant = T; % Ti-1
        for j  = 2 : Nx - 1
                T(j) = Tant(j) + dt/dx^2*d(j)*(Tant(j-1) + Tant(j+1) - 2*Tant(j));
        end
        %capete termostatate
        %T(1) = T10;
        %T(Nx) = T20;
        %capete izolate 
        T(1) = T(2);
        T(Nx) = T(Nx-1);
        plot(x,T0, '-r'); hold on;
        plot(x,T, '-b'); hold off;
        Film(i - 1,:) = getframe;
end

figure(2);
movie(Film, 1,round(Nt/tf));



