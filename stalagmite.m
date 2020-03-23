function [a] = stalagmite(input)

x = input(1);
y = input(2);

f1x = (sin(5.1*pi.*x+0.5))^6;
f1y = (sin(5.1*pi.*y+0.5))^6;

f2x = exp(-4*log(2).*(x-0.0667).^2/0.64);
f2y = exp(-4*log(2).*(y-0.0667).^2/0.64);

a = -(f1x*f2x*f1y*f2y);

end 