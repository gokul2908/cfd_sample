
clear all
close all
clc

a = 999;
b = (a+1)/2;
x = a+2

for i = 1:b
    digitsOld = digits(50);
    x = vpa(a,100)+((vpa(b,100)^2)/vpa(x,100))
    a = a-2;
    b = b-1;
end

value = vpa(4/x,100)
 
A = vpa(pi,100)-vpa(value)