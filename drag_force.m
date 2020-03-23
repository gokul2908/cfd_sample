close all
clear all
clc

% input parametes
A = 2.664;             %area in m3
p = 1.144;             %density in kg/m3
Cd = 0.23;             %coefficient of drag
V = [0:0.01:70.83];    %velocity in m/sec

drag = 0.5*A*Cd*p.*V.^2;

plot(V,drag)
xlabel('velocity in m/sec')
ylabel('drag force in N')