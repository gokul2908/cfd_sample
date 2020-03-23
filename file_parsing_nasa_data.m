clear all
close all 
clc

file = fopen('THERMO.dat','r');

line1 = fgetl(file);

line2 = fgetl(file);
split_temp = findstr(line2, ' ');
t_gmin = str2num(line2(split_temp(1):split_temp(4)));
t_gmid = str2num(line2(split_temp(5):split_temp(6)));
t_gmax = str2num(line2(split_temp(7):end));

%skipping line 3 to 5 
fgetl(file);
fgetl(file);
fgetl(file);

for i = 1:53
    
    line3 = fgetl(file);
    
    element = line3(1:6);
        
    temp = line3((49):end);
    split_temp =strsplit(temp,' ');
    t_lmin = str2num(split_temp{1});
    t_lmax = str2num(split_temp{2});
    t_lmid = str2num(split_temp{3});
    
    coefficient_line1 = fgetl(file);
    coefficient_line2 = fgetl(file);
    coefficient_line3 = fgetl(file);
    split_coefficientl1 =  findstr(coefficient_line1, 'E');
    split_coefficientl2 =  findstr(coefficient_line2, 'E');
    split_coefficientl3 =  findstr(coefficient_line3, 'E');
    
    c1 = str2num(coefficient_line1(1:(split_coefficientl1(1)+3)));
    c2 = str2num(coefficient_line1((split_coefficientl1(1)+4):(split_coefficientl1(2)+3)));
    c3 = str2num(coefficient_line1((split_coefficientl1(2)+4):(split_coefficientl1(3)+3)));
    c4 = str2num(coefficient_line1((split_coefficientl1(3)+4):(split_coefficientl1(4)+3)));
    c5 = str2num(coefficient_line1((split_coefficientl1(4)+4):(split_coefficientl1(5)+3)));
    
    c6 = str2num(coefficient_line2(1:(split_coefficientl2(1)+3)));
    c7 = str2num(coefficient_line2((split_coefficientl2(1)+4):(split_coefficientl2(2)+3)));
    c01 = str2num(coefficient_line2((split_coefficientl2(2)+4):(split_coefficientl2(3)+3)));
    c02 = str2num(coefficient_line2((split_coefficientl2(3)+4):(split_coefficientl2(4)+3)));
    c03 = str2num(coefficient_line2((split_coefficientl2(4)+4):(split_coefficientl2(5)+3)));
    
    c04 = str2num(coefficient_line3(1:(split_coefficientl3(1)+3)));
    c05 = str2num(coefficient_line3((split_coefficientl3(1)+4):(split_coefficientl3(2)+3)));
    c06 = str2num(coefficient_line3((split_coefficientl3(2)+4):(split_coefficientl3(3)+3)));
    c07 = str2num(coefficient_line3((split_coefficientl3(3)+4):(split_coefficientl3(4)+3)));
    
    %folder for the element
    mkdir('C:\Users\gokul\OneDrive\Desktop\matlab\1',element)    
    
    % w K T gas constant R
    R = 8.31446261815324;
    t = linspace(t_lmin,t_lmax,100);
    
    for k = 1:length(t)
        if t<t_gmid
        Cp = (c1+(c2.*t)+(c3*(t.^2))+(c4*(t.^3))+(c5(t.^4)))*R;
        H  = (c1+(c2.*t/2)+(c3*(t^2)/3)+(c4*(t^3)/4)+(c5*(t^4)/5)+(c6/t)).*t.*R;
        S  = ((c1.*log(t))+(c2.*t)+(c3.*(t.^2)/2)+(c4.*(t.^3)/3)+(c.*(t.^4)/4)+c7)*R;
        else
        Cp = (c01+(c02.*t)+(c03.*(t.^2))+(c04*(t.^3))+(c05*(t.^4)))*R;
        H  = (c01+(c02.*t/2)+(c03.*(t.^2)/3)+(c04.*(t.^3)/4)+(c05.*(t.^4)/5)+(c06./t)).*t.*R;
        S  = ((c01.*log(t))+(c02.*t)+(c03*(t.^2)/2)+(c04*(t.^3)/3)+(c05*(t.^4)/4)+c07)*R;
        end
    end
    
    %  plotting
    
    %t vs cp
    figure(1)
    plot(t,Cp,'linewidth',2)
    title(element)
    xlabel('local temperature')
    ylabel('Cp')
    %t vs enthalpy
    figure(2)
    plot(t,H,'linewidth',2)
    title(element)
    xlabel('local temperature')
    ylabel('Enthalpy in j/mol')
    %t vs entropy
    figure(3)
    plot(t,S,'linewidth',2)
    title(element)
    xlabel('local temperature')
    ylabel('Entropy in j/mol')
    
    directory = (['C:\Users\gokul\OneDrive\Desktop\matlab\1\', element]);
    cd(directory)
    
    %saving plot
    saveas(1, 'Specific heat.jpg');
    saveas(2, 'Enthalpy.jpg');
    saveas(1, 'Entropy.jpg');   
    
    % To calaculate  molecular weigth
    a = element;
    b = ['H','C','N','O','A'];
    c = [1.00794 12.0107 14.0067 15.9994 39.948];
    d =0;
    for i = 1:length(a)
        for j = 1:length(c)
            if strcmp(a(i),b(j))
                d = d + c(j);
                e = j;
            end 
        end
     n = str2double(a(i));
        if n>1
        d = d + (c(e)*(n-1));        
        end
    end
    molecular_mass = d;
    display(element)
    display(molecular_mass)
    
end

fclose(file)



