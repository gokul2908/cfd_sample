% x is theta
% l is length
clear all
close all 
clc
for x = 0:0.1:90
l = 1
x0 = 0
y0 = 0
y1 = l*sind(x);
x1 = ((l^2)-(y1^2))^(1/2);
plot([x0,x1],[y0,y1],'linewidth',2)
axis([0 1 0 1])
grid on
xlabel('xaxis')
ylabel('yaxis')
pause(0.001)
end
