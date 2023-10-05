clear all;clc;close all;
%%points must be in order on Ox axis
t=0;
p0=[0,0];
p1=[4,4];
p2=[8,2];
p3=[12,3];
y=[p0(end),p1(end), p2(end),p3(end)];
x=[p0(1),p1(1),p2(1),p3(1)];
plot(x,y,'r');

if(p0(end)==p1(end))
    sgnA=0;
else if (p0(end)<p1(end)) 
        sgnA = 1;
    else
        sgnA =-1;
    end
end

if(p1(end)==p2(end))
    sgnB=0;
else if (p1(end)<p2(end)) 
        sgnB = 1;
    else
        sgnB =-1;
    end
end
if(p2(end)==p3(end))
    sgnC=0;
else if (p2(end)<p3(end)) 
        sgnC = 1;
    else
        sgnC =-1;
    end
end


while t<0.71
    
pax=p0(1)+(t*pdist([p0;p1],'euclidean'))
pay=p0(2)+sgnA*(t*pdist([p0;p1],'euclidean'))
pbx=p1(1)+(t*pdist([p1;p2],'euclidean'))
pby=p1(2)+sgnB*(t*pdist([p1;p2],'euclidean'))
pcx=p2(1)+(t*pdist([p2;p3],'euclidean'))
pcy=p2(2)+sgnC*(t*pdist([p2;p3],'euclidean'))
pa=[pax,pay];
pb=[pbx,pby];
pc=[pcx,pcy];
t=t+0.1;

hold on;
y2=[pa(end),pb(end)];
x2=[pa(1),pb(1)];
plot(x2,y2,'b');
y3=[pb(end),pc(end)];
x3=[pb(1),pc(1)];
%plot(x3,y3,'g');
end