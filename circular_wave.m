% Circular wave
clear all; close all; clc;
psi0=1;
lambda=1;
vphi=1;
k=2*pi/lambda;
omega=k*vphi; T=2*pi/omega;
t=2.1; %aici va fi ciclu in tema;
x=linspace(-3*lambda,3*lambda,100);
y=x;
[xx,yy]=meshgrid(x,y);
for ix=1:length(x)
    for iy=1:length(y)
        ro=sqrt(x(ix)^2+y(iy)^2);
        if(ro>lambda/20)
            psi(iy,ix)=psi0/ro*sin(omega*t-k*ro);
        end
    end
end
surf(xx,yy,psi);
shading interp;
colormap spring;