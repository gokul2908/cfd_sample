clear all 
close all 
clc
cr = linspace(14,23,100);
gamma = 1.4
for i = 1:length(cr)
thermal_eff(i) = 1 - (1/cr(i)^(gamma-1))
end
plot(cr, thermal_eff,'linewidth',4)
xlabel('compression ratio')
ylabel('thermal efficiency')