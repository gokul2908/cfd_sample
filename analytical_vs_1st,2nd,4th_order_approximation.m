clear all
close all 
clc

%f(x) = sin(x)/x^3
% df(x)/dx = (x^3*(cos(x))-sin(x)*3*x^2)/x^6;

x = pi/3;
analytical_derivative = (x^3*(cos(x))-sin(x)*3*x^2)/x^6;

dx = pi/9

%first order approximation
forward_differencing = ((sin(x+dx)/(x+dx)^3)-(sin(x)/x^3))/dx;

%second_order_approximation
central_differencing = ((sin(x+dx)/(x+dx)^3)-(sin(x-dx)/(x-dx)^3))/(2*dx);

%fourth order approximation 
fourth_order_approximation = ((sin(x-(2*dx))/(x-(2*dx))^3)-(8*(sin(x-dx)/(x-dx)^3))+(8*(sin(x-dx)/(x-dx)^3))-(sin(x-(2*dx))/(x-(2*dx))^3))/(12*dx);

error_first_order = abs(forward_differencing-analytical_derivative)
error_second_order = abs(central_differencing-analytical_derivative)
error_fourth_order = abs(fourth_order_approximation-analytical_derivative)

X = [1,2,3]
Y = [error_first_order;  error_second_order; error_fourth_order]
bar(X,Y,'r')
xlabel('approximation--->')
ylabel('error--->')