%pendul dublu

close all; clear all; clc;

g = 9.81;

m1 = 0.5; %kg
m2 = 0.25; %kg

l1 = 0.6; %m
l2 = 0.4; %m

%C.I.
theta10i = -pi/2;
theta10f = pi/2;

omega10i = 0;
omega10f = 10;


point_count = 500;
colormap copper;
color1 = 0;
color2 = 1;
color3 = 2;
color4 = 3;
color5 = 4;
color6 = 5;

omega10 = linspace(omega10i, omega10f, point_count);
theta10 = linspace(theta10i, theta10f, point_count);

theta20 = 2*pi/3;
omega20 = 2;

r = l1/l2;

miu = m2/(m1+m2);

t0 = 0;
tf = 10;
steps = 50000;
t = linspace(t0,tf,steps);
dt = t(2) - t(1);

theta1 = zeros(1,steps);
theta2 = zeros(1,steps);

A1 = r/dt^2;
B2 = 1/r/dt^2;

NX = 800;

OX = round(NX/2);

theta2(1) = theta20;
theta2(2) = theta20 + omega20*dt;



color = zeros(point_count,point_count);

for j1 = 1:point_count
        theta1(1) = theta10(j1);

        for j2 = 1:point_count           
                theta1(2) = theta1(1) + omega10(j2)*dt;
                
                for i = 2:steps - 1
                        s = sin(theta2(i) - theta1(i));
                        c = cos(theta2(i) - theta1(i));
        
                        A2 = c/dt^2;
                        B1 = miu*A2;
        
                        M1 = miu*(theta2(i) - theta2(i-1))^2*s/dt^2 - g/l2*sin(theta1(i)) - r/dt^2*theta1(i-1) + 2*r/dt^2*theta1(i) - miu/dt^2*theta2(i-1)*c + 2*miu/dt^2*c*theta2(i);
                        M2 = -(theta1(i) - theta1(i-1))^2/dt^2*s - g/l1*sin(theta2(i)) - 1/r/dt^2*theta2(i-1) + 2/r/dt^2*theta2(i) - theta1(i-1)/dt^2*c + 2*theta1(i)/dt^2*c;
        
                        D = (A1*B2 - A2*B1);
        
                        theta1(i+1) = (M1*B2 - M2*B1)/D;
                        theta2(i+1) = (A1*M2 - A2*M1)/D;
                end

                xf = OX + l1*sin(theta1(steps)) + l2*sin(theta2(steps));
                
                if (xf < OX - l1)
                        color(j1,j2) = color1;
                else
                        if (xf >= OX - l1 && xf < OX - l1/2)
                                color(j1,j2) = color2;
                        else
                                if (xf >= OX - l1/2 && xf < OX)
                                        color(j1,j2) = color3;
                                else
                                        if (xf >= OX && xf < OX + l1/2)
                                                color(j1,j2) = color4;
                                        else
                                                if (xf >= OX + l1/2 && xf < OX + l1)
                                                        color(j1,j2) = color5;
                                                else
                                                        if (xf > OX + l1)
                                                                color(j1,j2) = color6;
                                                        end
                                                end
                                        end
                                end
                        end
                end
                
                
                
        end
end       


s = surf(color);
s.EdgeColor = 'none';
view(0,90);
        
     
     
        
        

