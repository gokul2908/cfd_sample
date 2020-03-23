% nothing
clear all 
close all
clc

density = [2000 3000 4000 5000];

volume = [1 1 1 1];

mass = density.*volume

plot(density,mass,'color','g');
xlabel('density')
ylabel('mass')
