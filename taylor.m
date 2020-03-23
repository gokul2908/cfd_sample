clear all
close all
clc

n = 50;
n_x = 1000;
x = linspace(0,5,n_x) ;

for i = 1:(n_x)
    
   for j = 1:n
       term(j) = x(i)^(j-1)/factorial(j-1);
   end
   
   taylor_series_approximation(i) = sum(term);
end 
 
plot(x, exp(x), 'linewidth',4, 'color', 'r')
hold on
plot(x, taylor_series_approximation,'linewidth',1, 'color', 'b'  )



