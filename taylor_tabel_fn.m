clear all
close all
clc

%f = exp(x)*cos(x)
x = pi/4;

dX = linspace(pi/100,pi/1000,20);

analytical_solution = -2*exp(x)*sin(x);

for i = 1:length(dX)
    dx = dX(i);
    central_diff(i) =  ((-1*exp(x-2*dx)*cos(x-2*dx))+(16*exp(x-dx)*cos(x-dx))-(30*exp(x)*cos(x))+(16*exp(x+dx)*cos(x+dx))-(exp(x+2*dx)*cos(x+2*dx)))/(12*dx^2);
    forward_diff(i)=((45*exp(x)*cos(x))+(-154*exp(x+dx)*cos(x+dx))+(214*exp(x+(2*dx))*cos(x+(2*dx)))+(-156*exp(x+(3*dx))*cos(x+(3*dx)))+(61*exp(x+(4*dx))*cos(x+(4*dx)))+(-10*exp(x+(5*dx))*cos(x+(5*dx))))./(12*(dx.^2));
    backward_diff(i)=((45*exp(x)*cos(x))+(-154*exp(x-dx)*cos(x-dx))+(214*exp(x-(2*dx))*cos(x-(2*dx)))+(-156*exp(x-(3*dx))*cos(x-(3*dx)))+(61*exp(x-(4*dx))*cos(x-(4*dx)))+(-10*exp(x-(5*dx))*cos(x-(5*dx))))./(12*(dx.^2));
end

error_central_diff  = abs(central_diff-analytical_solution)
error_forward_diff  = abs(forward_diff-analytical_solution)
error_backward_diff = abs(backward_diff-analytical_solution)

hold on 
plot(dX,error_central_diff)
plot(dX,error_forward_diff)
plot(dX,error_backward_diff)
xlabel('dx')
ylabel('error')
legend('central difference','forward difference','backward difference')

