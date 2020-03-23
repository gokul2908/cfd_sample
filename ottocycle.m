clear all
close all
clc

%engine specs
stroke = 0.1;
con_rod = 0.15;
bore = 0.1;
cr = 21.5;

%input
p1 = 1.01235;
t1 = 273;
t3 = 1800;
gamma =1.4;

%formulas
swept_volume = pi/4*bore^2*stroke
clearance_volume = swept_volume/(cr-1)
v1 = (swept_volume+clearance_volume)
v2 = clearance_volume

% thermal efficency
thermal_eff = 1 - (1/cr^(gamma-1))

%1-2
c1 = p1*v1^gamma   %constant
p2 = c1/(v2^gamma)  

v_compression = piston_kinematics(stroke,con_rod,bore,cr,0,180);
p_compression = c1./v_compression.^gamma;

%2-3
t2 = p2*v2*t1/(p1*v1)
p3 = p2*t3/t2
v3 = v2  % constant volume process

%3-4
v4 = v1
c2 = p3*v3^gamma
p4 = p3*(v3^gamma)/(v4^gamma)

v_expansion = piston_kinematics(stroke,con_rod,bore,cr,0,180);
p_expansion = c2./v_expansion.^gamma;

hold on
plot(v1,p1,'*','color','Y')
plot(v_compression,p_compression,'color','R')
plot(v2,p2,'*','color','Y')
plot([v2 v3],[p2 p3],'color','b')
plot(v3,p3,'*','color','Y')
plot(v_expansion,p_expansion,'color','R')
plot(v4,p4,'*','color','Y')
plot([v4 v1],[p4 p1],'color','b')
xlabel('volume in m^3')
ylabel('pressure in bar')

grid on

