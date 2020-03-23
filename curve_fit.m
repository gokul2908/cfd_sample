%curve fit
clear all
close all
clc

% loading data from external file
cp_and_temp = load('data');

temp = cp_and_temp(:,1);
cp = cp_and_temp(:,2);

%order of polynomial
x = [19] 

%counter 
ct =1

for i = 1 : length(x)
    a = x(i);
    
    coefficient = polyfit(temp,cp,a);
    predict_cp = polyval(coefficient,temp);
    
    %plotting
    figure(ct)
    plot(temp,cp,'linewidth',4,'color','b')
    hold on
    plot(temp,predict_cp,'linewidth',2,'color','r')
    xlabel('temp')
    ylabel('specific heat')
    legend('original','obtained')
    ct = ct+1;
    
end
 


