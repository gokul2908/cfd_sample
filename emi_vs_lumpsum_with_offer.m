clear all
close all
clc
p = 33000;
r = 7.5/100;
for i =1:24
    a(i) = p*r/12;
    if i==2
        b(i-1) = a(i)+a(i-1)
    elseif i>2
        b(i-1)=a(i)+b(i-2)
    end
    p = p-1375;
end
