clear all
close all
clc

% r - growth rate
% xn - population percentage in this year
% t is year
xn = 0.4
r = linspace(1,4,70000)

t = 1:1000
for j = 1:length(r)
    for i = 1:length(t)
    xn1(j,i) = r(j)*xn*(1-xn)
    xn = xn1(j,i)
    end
end

for k = 1:length(r)
figure(k)
plot(t,xn1(k,:))
end

