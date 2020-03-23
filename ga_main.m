clear all
close all
clc

x = linspace(0,0.6,150);
y = linspace(0,0.6,150);

[xx,yy] = meshgrid(x,y)

for i = length(xx)
    for j = 1 : length(yy)
        input(1) = xx(i,j);
        input(2) = yy(i,j);
        f(i,j) = stalagmite(input)
    end
end

surfc(xx,yy,f)

shading interp

[inputs, fval] = ga(@stalagmite, 2)




