%Oscilator cu 3 grade de libertate
clear all; close all; clc;

%Masa KG; Constanta elastica N/M; Numarul de bile
m = 1;
k = 100;
P = 100; 

%Discretizare timp
t0 = 0;
tf = 20;
N = 5000;
t = linspace(t0, tf, N);
dt = t(2) - t(1);

csi = zeros(P, N);
csi_s = zeros(1, N);
csi_d = zeros(1, N);

a = 1; %Amplitudinea perturbatiei
omega = pi / 2;

f = zeros(1,N);
choice = menu('Choose a function:' ,'Sin^2', 'Cos^2','1(t)');
switch choice
        case 1
                f(t<2) = a*sin(omega*t(t<2)).^2;
        case 2
                f(t<2) = a*cos(omega*t(t<2)).^2;
        case 3
                f(t<2) = 1;
end 


for i = 2 : N - 1
    for j = 2 : P - 1
        csi(j, i+1) = 2 * csi(j, i) - csi(j, i-1)- k * dt^2 / m * (2*csi(j,i) - csi(j-1,i) - csi(j+1,i));
    end
    csi(1,i+1) = 2*csi(1,i) - csi(1,i-1) - dt^2 * k/m*(2*csi(1,i) - f(i) - csi(2,i));
    csi(P,i+1) = 2*csi(P,i) - csi(P,i-1) - dt^2 * k/m*(2*csi(P,i) - csi(P-1,i) - csi_d(i));
    csi_d(i+1) = csi(P,i+1);
end;


%Timp si bila de repr pe grafic
[tg, bg] = meshgrid(t,1:P);
surf(tg, bg, csi);
zlabel('Elongatie', 'FontWeight' ,'bold');
xlabel('Timp', 'FontWeight' ,'bold');
ylabel('Nr bile', 'FontWeight' ,'bold');
colormap winter;
shading interp;


%Viteza undei este l/dt, unde dt este diferenta dintre momentele de timp in care
%bila i si i+1 isi ating maximele