function [dtheta_dt] = ode_func(theta,b,g,l,m)

theta1 =theta(1);  %1
theta2 =theta(2);  %0
dtheta1_dt = theta2;  %d0/dt = 02
dtheta2_dt = -(b/m)*theta(2) -(g/l*sin(theta(1)));  %d^20/dt^2
dtheta_dt = [dtheta1_dt; dtheta2_dt];

end
