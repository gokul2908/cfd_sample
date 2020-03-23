clear all
close all
clc
third = 6.769;
forth = 7.32;
fifth = 7.875;
sixth = 7.083;
seventh = 7.04;
eigth = linspace(7,9,10)

for i = 1:length(eigth)
   cgpa(i) = (third + forth + fifth + sixth + seventh + eigth(i))/6
end
plot(eigth,cgpa)
grid on