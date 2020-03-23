
clear all
close all 
clc
%input arguments
l = 1; % m
n = 80; % no. of nodes
x = linspace(0,l,n);
c = 1; % b.c. velocity in m/s
dt = [1e-4 1e-3 1e-2 1e-1]; % time step in seconds
dx = x(2)-x(1);
u = c*ones(1,n);
T = 0.4 % sec

% At x = 0.2 to 0.3,  u = 2
x_start = 0.2;
x_end = 0.3;

% calling function to find the index value
[a] = index_val(x,x_start);
[b] = index_val(x,x_end);
start_pt = a ;
end_pt = b ;
u(start_pt:end_pt) = 2; %m/s

% boundary condition 
u(1) = 1; % m/s
uold = u ;

hold on
plot(x,u,'r')

for k = 4
    nt = T/dt(k);
    for j = 1:nt
        for i = 2:n 
            u(i) = uold(i) - (c*dt(k)/dx)*(uold(i)-uold(i-1));
        end
        uold = u;
    end
   
end 
plot(x,u,'color', rand(1,3))
xlabel('xaxis')
ylabel('velocity u ')
grid on
axis([0 1 0 2])
