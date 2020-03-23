clear all
close all
clc
upto = 10000
n = [1:upto] ;
b = 1;
c =1;
for j = 1 : length(n)
 if (n(j) == 1)
     result = 0;
 elseif (n(j) == 2)
     result = 1;
 else 
    for i=2:n(j)-1,
        if (mod(n(j),i)==0)
           result = 0;
           break
        end
        result = 1;
    end
 end 
 
 if (result == 1)
     %fprintf('%f\n',n(j))
     a(b) = n(j);
     if j>1
         c(j) = (c(j-1))+1;
     end
     b = b+1
 else
     if j>1
     c(j) = c(j-1)
     end
 end
end
plot(n,c,'*')
grid on
