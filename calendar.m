clear all
close all
clc

leap_year = 1
starting_day_of_year = 'wed'
if starting_day_of_year == 'mon'
    aa = 0
end
if starting_day_of_year == 'tue'
    aa = 1
end
if starting_day_of_year == 'wed'
    aa = 2
end
if starting_day_of_year == 'thu'
    aa = 3
end
if starting_day_of_year == 'fri'
    aa = 4
end
if starting_day_of_year == 'sat'
    aa = 5
end
if starting_day_of_year == 'sun'
    aa = 6
end

jan = 1:31
feb = 1:28
febl= 1:29
mar = 1:31
apr = 1:30
may = 1:31
jun = 1:30
jul = 1:31
aug = 1:31
sep = 1:30
oct = 1:31
nov = 1:30
dec = 1:31
a = 0;
x =[aa,length(jan),length(feb),length(mar),length(apr),length(may),length(jun),length(jul),length(aug),length(sep),length(oct),length(nov),length(dec)] 
xl = [aa,length(jan),length(febl),length(mar),length(apr),length(may),length(jun),length(jul),length(aug),length(sep),length(oct),length(nov),length(dec)] 

if leap_year == 0
for i = 1:length(x)
    B(i) = a + x(i);
    a = B(i);
end
for i = 1:(365+aa)
    if i>0 && i<=B(1)
        a(i) = 0
    end
    if i>B(1) && i<=B(2)
        
        a(i) = jan(i-B(1))
        
    end
    if  i>B(2) && i<=B(3)
        
        a(i) = feb(i-B(2))
        
    end
    if i>B(3) && i<=B(4)
        
        a(i) = mar(i-B(3))
        
    end
    if i>B(4) && i<=B(5)
        
        a(i) = apr(i-B(4))
        
    end
    if i>B(5) && i<=B(6)
        
        a(i) = may(i-B(5))
        
    end
    if i>B(6) && i<=B(7)
        
        a(i) = jun(i-B(6))
        
    end
    if i>B(7) && i<=B(8)
        
        a(i) = jul(i-B(7))
        
    end
    if i>B(8) && i<=B(9)
        
        a(i) = aug(i-B(8))
        
    end
    if i>B(9) && i<=B(10)
        
        a(i) = sep(i-B(9))
        
    end
    if i>B(10) && i<=B(11)
        
        a(i) = oct(i-B(10))
        
    end
    if i>B(11) && i<=B(12)
        
        a(i) = nov(i-B(11))
        
    end
    if i>B(12) && i<=B(13)
        
        a(i) = dec(i-B(12))
        
    end
end
end

if leap_year == 1
    for i = 1:length(xl)
        B(i) = a + xl(i);
        a = B(i);
    end
for i = 1:(366+aa)
    if i>0 && i<=B(1)
        a(i) = 0
    end
    if i>B(1) && i<=B(2)
        
        a(i) = jan(i-B(1))
        
    end
    if  i>B(2) && i<=B(3)
        
        a(i) = febl(i-B(2))
        
    end
    if i>B(3) && i<=B(4)
        
        a(i) = mar(i-B(3))
        
    end
    if i>B(4) && i<=B(5)
        
        a(i) = apr(i-B(4))
        
    end
    if i>B(5) && i<=B(6)
        
        a(i) = may(i-B(5))
        
    end
    if i>B(6) && i<=B(7)
        
        a(i) = jun(i-B(6))
        
    end
    if i>B(7) && i<=B(8)
        
        a(i) = jul(i-B(7))
        
    end
    if i>B(8) && i<=B(9)
        
        a(i) = aug(i-B(8))
        
    end
    if i>B(9) && i<=B(10)
        
        a(i) = sep(i-B(9))
        
    end
    if i>B(10) && i<=B(11)
        
        a(i) = oct(i-B(10))
        
    end
    if i>B(11) && i<=B(12)
        
        a(i) = nov(i-B(11))
        
    end
    if i>B(12) && i<=B(13)
        
        a(i) = dec(i-B(12))
        
    end
end
end

for i = 1:12
    if i ==1
        fprintf('JANUARY\n')
        fprintf('  mon tue wed thu fri sat sun \n')
        for i = 1:B(2)        % jan
            if a(i)<10
                fprintf('   ')
            end
            if a(i)>=10
                fprintf('  ')
            end
                fprintf(num2str(a(i)))             
            if mod(i,7) == 0
                fprintf('\n')
            end
        end
        fprintf('\n-----------------------------------\n')
    end
    if i ==2
        fprintf('FEBRUARY\n')
        fprintf('  mon tue wed thu fri sat sun \n')
        if mod(B(2),7) == 1
                fprintf('  ')
        end
        if mod(B(2),7) == 2
                fprintf('  --')
        end
        if mod(B(2),7) == 3
                fprintf('  --- --')
        end
        if mod(B(2),7) == 4
                fprintf('  --- --- --')
        end
        if mod(B(2),7) == 5
                fprintf('  --- --- --- --')
        end
        if mod(B(2),7) == 6
                fprintf('  --- --- --- --- --')
        end
        for i = B(2):B(3)
            if a(i)<10
                fprintf('   ')
            end
            if a(i)>=10
                fprintf('  ')
            end
                fprintf(num2str(a(i)))             
            if mod(i,7) == 0
                fprintf('\n')
            end
        end
        fprintf('\n-----------------------------------\n')
    end
    if i ==3
        fprintf('MARCH\n')
        fprintf('  mon tue wed thu fri sat sun \n')
        if mod(B(3),7) == 1
                fprintf('  --')
        end
        if mod(B(3),7) == 2
                fprintf('  --- --')
        end
        if mod(B(3),7) == 3
                fprintf('  --- --- --')
        end
        if mod(B(3),7) == 4
                fprintf('  --- --- --- --')
        end
        if mod(B(3),7) == 5
                fprintf('  --- --- --- --- --')
        end
        if mod(B(3),7) == 6
                fprintf('  --- --- --- --- --- --')
        end
        for i = B(3):B(4)      % jan
            if a(i)<10
                fprintf('   ')
            end
            if a(i)>=10
                fprintf('  ')
            end
                fprintf(num2str(a(i)))             
            if mod(i,7) == 0
                fprintf('\n')
            end
        end
        fprintf('\n-----------------------------------\n')
    end
    if i ==4
        fprintf('APRIL\n')
        fprintf('  mon tue wed thu fri sat sun \n')
        if mod(B(3),7) == 1
                fprintf('  --')
        end
        if mod(B(3),7) == 2
                fprintf('  --- --')
        end
        if mod(B(3),7) == 3
                fprintf('  --- --- --')
        end
        if mod(B(3),7) == 4
                fprintf('  --- --- --- --')
        end
        if mod(B(3),7) == 5
                fprintf('  --- --- --- --- --')
        end
        if mod(B(3),7) == 6
                fprintf('  --- --- --- --- --- --')
        end
        for i = B(4):B(5)        % jan
            if a(i)<10
                fprintf('   ')
            end
            if a(i)>=10
                fprintf('  ')
            end
                fprintf(num2str(a(i)))             
            if mod(i,7) == 0
                fprintf('\n')
            end
        end
        fprintf('\n-----------------------------------\n')
    end
    if i ==5
        fprintf('MAY\n')
        fprintf('  mon tue wed thu fri sat sun \n')
        if mod(B(2),7) == 1
                fprintf('       ')
        end
        if mod(B(2),7) == 2
                fprintf('           ')
        end
        if mod(B(2),7) == 3
                fprintf('               ')
        end
        if mod(B(2),7) == 4
                fprintf('                   ')
        end
        if mod(B(2),7) == 5
                fprintf('                       ')
        end
        if mod(B(2),7) == 6
                fprintf('                           ')
        end
        for i = B(5):B(6)        % jan
            if a(i)<10
                fprintf('   ')
            end
            if a(i)>=10
                fprintf('  ')
            end
                fprintf(num2str(a(i)))             
            if mod(i,7) == 0
                fprintf('\n')
            end
        end
        fprintf('\n-----------------------------------\n')
    end
    if i ==6
        fprintf('JUNE\n')
        fprintf('  mon tue wed thu fri sat sun \n')
        if mod(B(2),7) == 1
                fprintf('       ')
        end
        if mod(B(2),7) == 2
                fprintf('           ')
        end
        if mod(B(2),7) == 3
                fprintf('               ')
        end
        if mod(B(2),7) == 4
                fprintf('                   ')
        end
        if mod(B(2),7) == 5
                fprintf('                       ')
        end
        if mod(B(2),7) == 6
                fprintf('                           ')
        end
        for i = B(6):B(7)        % jan
            if a(i)<10
                fprintf('   ')
            end
            if a(i)>=10
                fprintf('  ')
            end
                fprintf(num2str(a(i)))             
            if mod(i,7) == 0
                fprintf('\n')
            end
        end
        fprintf('\n-----------------------------------\n')
    end
    if i ==7
        fprintf('JULY\n')
        fprintf('  mon tue wed thu fri sat sun \n')
        if mod(B(2),7) == 1
                fprintf('       ')
        end
        if mod(B(2),7) == 2
                fprintf('           ')
        end
        if mod(B(2),7) == 3
                fprintf('               ')
        end
        if mod(B(2),7) == 4
                fprintf('                   ')
        end
        if mod(B(2),7) == 5
                fprintf('                       ')
        end
        if mod(B(2),7) == 6
                fprintf('                           ')
        end
        for i = B(7):B(8)        % jan
            if a(i)<10
                fprintf('   ')
            end
            if a(i)>=10
                fprintf('  ')
            end
                fprintf(num2str(a(i)))             
            if mod(i,7) == 0
                fprintf('\n')
            end
        end
        fprintf('\n-----------------------------------\n')
    end
    if i ==8
        fprintf('AUGUST\n')
        fprintf('  mon tue wed thu fri sat sun \n')
        if mod(B(2),7) == 1
                fprintf('       ')
        end
        if mod(B(2),7) == 2
                fprintf('           ')
        end
        if mod(B(2),7) == 3
                fprintf('               ')
        end
        if mod(B(2),7) == 4
                fprintf('                   ')
        end
        if mod(B(2),7) == 5
                fprintf('                       ')
        end
        if mod(B(2),7) == 6
                fprintf('                           ')
        end
        for i = B(8):B(9)        % jan
            if a(i)<10
                fprintf('   ')
            end
            if a(i)>=10
                fprintf('  ')
            end
                fprintf(num2str(a(i)))             
            if mod(i,7) == 0
                fprintf('\n')
            end
        end
        fprintf('\n-----------------------------------\n')
    end
    if i ==9
        fprintf('SEPTEMBER\n')
        fprintf('  mon tue wed thu fri sat sun \n')
        if mod(B(2),7) == 1
                fprintf('       ')
        end
        if mod(B(2),7) == 2
                fprintf('           ')
        end
        if mod(B(2),7) == 3
                fprintf('               ')
        end
        if mod(B(2),7) == 4
                fprintf('                   ')
        end
        if mod(B(2),7) == 5
                fprintf('                       ')
        end
        if mod(B(2),7) == 6
                fprintf('                           ')
        end
        for i = B(9):B(10)        % jan
            if a(i)<10
                fprintf('   ')
            end
            if a(i)>=10
                fprintf('  ')
            end
                fprintf(num2str(a(i)))             
            if mod(i,7) == 0
                fprintf('\n')
            end
        end
        fprintf('\n-----------------------------------\n')
    end
    if i ==10
        fprintf('OCTOBER\n')
        fprintf('  mon tue wed thu fri sat sun \n')
        if mod(B(2),7) == 1
                fprintf('       ')
        end
        if mod(B(2),7) == 2
                fprintf('           ')
        end
        if mod(B(2),7) == 3
                fprintf('               ')
        end
        if mod(B(2),7) == 4
                fprintf('                   ')
        end
        if mod(B(2),7) == 5
                fprintf('                       ')
        end
        if mod(B(2),7) == 6
                fprintf('                           ')
        end
        for i = B(10):B(11)        % jan
            if a(i)<10
                fprintf('   ')
            end
            if a(i)>=10
                fprintf('  ')
            end
                fprintf(num2str(a(i)))             
            if mod(i,7) == 0
                fprintf('\n')
            end
        end
        fprintf('\n-----------------------------------\n')
    end
    if i ==11
        fprintf('NOV\n')
        fprintf('  mon tue wed thu fri sat sun \n')
        if mod(B(2),7) == 1
                fprintf('       ')
        end
        if mod(B(2),7) == 2
                fprintf('           ')
        end
        if mod(B(2),7) == 3
                fprintf('               ')
        end
        if mod(B(2),7) == 4
                fprintf('                   ')
        end
        if mod(B(2),7) == 5
                fprintf('                       ')
        end
        if mod(B(2),7) == 6
                fprintf('                           ')
        end
        for i = B(11):B(12)        % jan
            if a(i)<10
                fprintf('   ')
            end
            if a(i)>=10
                fprintf('  ')
            end
                fprintf(num2str(a(i)))             
            if mod(i,7) == 0
                fprintf('\n')
            end
        end
        fprintf('\n-----------------------------------\n')
    end
    if i ==12
        fprintf('DECEMBER\n')
        fprintf('  mon tue wed thu fri sat sun \n')
        if mod(B(2),7) == 1
                fprintf('       ')
        end
        if mod(B(2),7) == 2
                fprintf('           ')
        end
        if mod(B(2),7) == 3
                fprintf('               ')
        end
        if mod(B(2),7) == 4
                fprintf('                   ')
        end
        if mod(B(2),7) == 5
                fprintf('                       ')
        end
        if mod(B(2),7) == 6
                fprintf('                           ')
        end
        for i = B(12):B(13)        % jan
            if a(i)<10
                fprintf('   ')
            end
            if a(i)>=10
                fprintf('  ')
            end
                fprintf(num2str(a(i)))             
            if mod(i,7) == 0
                fprintf('\n')
            end
        end
        fprintf('\n-----------------------------------\n')
    end
    
end


    
