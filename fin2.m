clear all 
close all
clc

t_a = 35+273 % in K
t_b = 65+273 % in K
h = 140 % in W/m2K
k = 55  % in W/mK
Q = 105 % in watt
 
l = 43.3/1000;
b = 38/1000;
P = 2*(l+b);
A = l*b;

h = ((Q /(t_b-t_a))^2) /(P*k*A)

fprintf('The heat transfer coefficient is %f W/m2K',h)