clear all 
close all
clc

t_a = 35+273; % in K
t_b = 65+273; % in K
h = 833 ;% in W/m2K
k = 55;  % in W/mK
%Q = 40 % in watt
 
l = 43.3/1000;
b = 38/1000;
P = 2*(l+b);
A = l*b;
m = (h*P/(k*A))^(1/2);
L = linspace(0.01,1,100);
for i = 1 : length(L)
    Q(i) =  (t_b-t_a)*(((tanh(m*L(i)))+(h/(m*k)))/(1+((h/(m*k))*tanh(m*L(i)))))*(h*P*k*A)^0.5;
    if Q(i)>105
        display(i)
        a = i
        break
    end
end
fprintf('the length req is %f m',L(i))
