clear all
close all 
clc

n =0:10;
C = n;
H = 2*n+2;
a = n;
Co2 = a;

for i = 1:3
    if  i == 1
        display('Alkane')
        b = n+1;
    end
    if  i == 2
        display('Alkyne')
        b = n-1;
    end
    if  i == 3
        display('Alkene')
        b = n;
    end
    H2o = b;
    ar = 2*a+b;
    c = 3.76*ar;
    N2 = c;
    O = 2*ar;
    N2 = 3.76*ar;
   % figure(1)
    hold on
    plot(C,ar,'color',rand(1,3))
    xlabel('number of moles of carbon')
    ylabel('Stoichiometric co-efficient of ar carbon')
    axis([0 10 0 44]);
end
legend('alkane','alkyne','alkene')