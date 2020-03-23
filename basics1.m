clear all;
close all;
clc;

a = linspace(-1,1,400);

b = linspace(-1,1,400);

[xx, yy] = meshgrid(a,b)

zz = xx.^2+yy.^2

contourf(xx,yy,zz,11);


