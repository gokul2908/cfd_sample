clear all
close all
clc

x = linspace(0,0.6,150);
y = linspace(0,0.6,150);
n = 100;
[xx,yy] = meshgrid(x,y);

for i = 1:length(xx)
    for j = 1 : length(yy)
        input3(1) = xx(i,j);
        input3(2) = yy(i,j);
        f(i,j) = stalagmite(input3);
    end
end

%case 3 : static behaviour of ga by increaing no. of iterations

options = optimoptions('ga');
options = optimoptions(options, 'populationsize',200);
tic
for k = 1:n
  [inputs3, fopt3(k)] = ga(@stalagmite, 2,[],[],[],[],[0;0],[1;1],[],[],options );
  xopt3(k) = inputs3(1);
  yopt3(k) = inputs3(2);
end

fopt3 = fopt3;

time_study3 = toc;
figure(3)
subplot(2, 1, 1)
hold on 
surfc(x,y,f)
shading interp
plot3(xopt3, yopt3 ,fopt3, 'color' , 'b', 'marker' , 'o','markersize', 5,'markerfacecolor' , 'r');
title('unbounded inputs')
subplot(2, 1, 2)
plot(fopt3,'color','b','linewidth',2)
xlabel('iteration');
ylabel('fuction maximum');
rng('default');
