clear all
close all
clc

x = linspace(0,0.6,150);
y = linspace(0,0.6,150);
n = 10;
[xx,yy] = meshgrid(x,y);

for i = 1:length(xx)
    for j = 1 : length(yy)
        inputs2(1) = xx(i,j);
        inputs2(2) = yy(i,j);
        f(i,j) = stalagmite(inputs2);
    end
end

%case 2 : static behaviour of ga with upper & lower bounds
tic
for k = 1:n
  [inputs2, fopt2(k)] = ga(@stalagmite, 2,[],[],[],[],[0;0],[1;1]);
  xopt2(k) = inputs2(1);
  yopt2(k) = inputs2(2);
end

fopt2 = -fopt2;
time_study2 = toc;
figure(2)
subplot(2, 1 ,1)
hold on 
surfc(x,y,f)
shading interp
plot3(xopt2, yopt2, fopt2, 'color' , 'b', 'marker' , 'o','markersize', 5,'markerfacecolor' , 'r');
title('unbounded inputs')
subplot(2, 1, 2)
plot(fopt,'color','b','linewidth',1)
xlabel('iteration');
ylabel('fuction maximum');