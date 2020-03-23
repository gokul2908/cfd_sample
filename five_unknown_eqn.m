clear all
close all 
clc
% i = 1,2,3 for central difference method,forward difference method, backward difference method
i = 1;

syms a b c d e f
if i ==1
% central difference method
eqn1 = a+b+c+d+e == 0;
eqn2 = b+(2*c)-d-(2*e) == 0;
eqn3 = b+(4*c)+d+(4*e) == 2;
eqn4 = b+(8*c)-d-(8*e) == 0;
eqn5 = b+(16*c)+d+(16*e) == 0;
end

if i == 2
% forward difference method
eqn1 = a+b+c+d+e ==0;
eqn2 = b+2*c+3*d+4*e ==0;
eqn3 = b+4*c+9*d+16*e ==2;
eqn4 = b+8*c+27*d+64*e ==0;
eqn5 = b+16*c+81*d+256*e ==0;
eqn6 = b
end

if i ==3
% backward difference method
eqn1 = a+b+c+d+e ==0;
eqn2 = -b-2*c-3*d-4*e ==0;
eqn3 = b+4*c+9*d+16*e ==2;
eqn4 = -b-8*c-27*d-64*e ==0;
eqn5 = b+16*c+81*d+256*e ==0;
end

A = solve([eqn1 eqn2 eqn3 eqn4 eqn5],a,b,c,d,e);

coeff_a = A.a
coeff_b = A.b
coeff_c = A.c
coeff_d = A.d
coeff_e = A.e
