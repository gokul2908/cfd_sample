clear all
close all 
clc

u = 25; %m/s 
L = 1.044; %m
rho = 1.225; %kg/m3
mu = 0.000018375; %kg/m.s
Y_plus = input('enter desired value of Y+');

Re = u*L*rho/mu; %reynolds number

cf = 0.026/(Re^(1/7)); %skin friction coefficient

T_wall = 0.5*cf*rho*u^2; %wall shear stress

U_fri = sqrt(T_wall/rho); %friction velocity 

del_s = Y_plus*mu/(U_fri*rho);

growthrate = 1.2; %growth rate of next cell from previous cell
no_cell = 6; % no of cells
tot_thick = del_s*2*1.2^(no_cell-1);

fprintf('\n Reynolds number is %d \n \n',Re);
fprintf(' first wall thickness is %d in m\n \n',del_s);
fprintf(' Total thickness of the cell %d in m\n', tot_thick);
