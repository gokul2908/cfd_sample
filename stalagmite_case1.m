clear all
close all
clc

x = linspace(0,0.6,150);
y = linspace(0,0.6,150);
n = 50;
[xx,yy] = meshgrid(x,y);

for i = 1:length(xx)
    for j = 1 : length(yy)
        input(1) = xx(i,j);
        input(2) = yy(i,j);
        f(i,j) = stalagmite(input);
    end
end

%case 1 : static behaviour of ga
tic
for k = 1:n
  [inputs, fopt(k)] = ga(@stalagmite, 2);
  xopt(k) = inputs(1);
  yopt(k) = inputs(2);
end

time_study1 = toc;
figure(1)
subplot(2, 1, 1)
hold on 
surfc(x,y,f)
shading interp
plot3(xopt, yopt, fopt, 'color' , 'b', 'marker' , 'o','markersize', 5,'markerfacecolor' , 'r');
title('unbounded inputs')
subplot(2, 1, 2)
plot(fopt,'color','b','linewidth',1)
xlabel('iteration');
ylabel('fuction maximum');

