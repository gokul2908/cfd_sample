clear all
close all 
clc

salary_monthly = linspace(15000,40000,10);
M = 800000
i = 0.09
for i = 1:length(salary_monthly)
    P(i) = 0.5*salary_monthly(i)
    n(i) = (log(((M/((1+i)*P(i)))*i)+1))/log(1+i)
    m(i) = n(i)*12
end

plot(salary_monthly,m)
xlabel('salary monthly')
ylabel('time')
grid on
