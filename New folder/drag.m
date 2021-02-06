clear all
close all
clc

rho = 1.225;
v = linspace(0.1,71.5,100); %m/s
Cd = 0.21;
A = 2.36; %m2
Fd = 0.5*rho*(v.^2)*Cd*A;

plot(v,Fd)
grid on