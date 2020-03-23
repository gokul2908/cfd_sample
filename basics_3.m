clear all
close all 
clc
a = 'C2H4';

b = ['H','C','N','O','A']
c = [1.00794 12.0107 14.0067 15.9994 39.948]
d =0
for i = 1:length(a)
    for j = 1:length(c)
        if strcmp(a(i),b(j))
            d = d + c(j)
            e = j
        end 
        
    end
     n = str2double(a(i))
        if n>1
        d = d + (c(e)*(n-1))
        end
end
molecular_mass = d