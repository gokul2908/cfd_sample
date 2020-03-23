clear all 
close all 
clc

cc = 1000
dia = linspace(5,30,100)
for i = 1:length(dia)
   a(i) = (pi/4)*(dia(i))^2
   stroke(i) = cc/a(i)
end
for j = 1 : length(dia)
    circumferential_area(j) = pi*dia(j)*stroke(j)
end
figure(1)
plot(dia,stroke)
xlabel('dia')
ylabel('stroke')
figure(2)
plot(dia,circumferential_area)
xlabel('dia')
ylabel('c area')
figure(3)
plot(stroke,circumferential_area)
xlabel('stoke')
ylabel('c area')
