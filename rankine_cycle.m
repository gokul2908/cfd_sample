clear all
close all
clc

disp('RANKINE CYCLE');
disp('1-2 : isentropic expansion')
disp('2-3 : constant pressure heat rejection')
disp('3-4 : isentropic compression')
disp('4-1 : constant pressure heat addition')
%input parameters
t1 = 400;
p1 = 30;
p2 = 0.05;
%---pt 1---
h1 = XSteam('h_pt',p1,t1);
s1 = XSteam('s_pt',p1,t1);
ts1 = XSteam('Tsat_p',p1);
sf1 = XSteam('sL_p',p1);
sg1 = XSteam('sV_p',p1);
hf1 = XSteam('hL_p',p1);
hg1 = XSteam('hV_p',p1);
%exit parameters for turbine
s2 = s1;
sf2 = XSteam('sL_p',p2);
sg2 = XSteam('sV_p',p2);
sfg2 = sg2 - sf2;
hf2 = XSteam('hL_p',p2);
hg2 = XSteam('hV_p',p2);
hfg2 = hg2 - hf2;
ts2 = XSteam('Tsat_p',p2);
%specific heat capacity for vapour
cpv1 = XSteam('CpV_p',p1);
cpv2 = XSteam('CpV_p',p2);
cvv1 = XSteam('CvV_p',p1);
cvv2 = XSteam('CvV_p',p2);
%specific heat capacity for liquid
cpl1 = XSteam('CpL_p',p1);
cpl2 = XSteam('CpL_p',p2);
cvl1 = XSteam('CvL_p',p1);
cvl2 = XSteam('CvL_p',p2);

%---pt 2---
         
%dryness factor
x = (s2 - sf2)/sfg2;             
%temperature at exit
if x < 1
    t2 = ts2+273;
else
    t2 = ts2*exp((s2-sg2)/cpv2);
end
t2 = t2-273;
%enthalpy at exit 
if x < 1
    h2 = hf2 + (x*hfg2);            
else
    h2 = hg2+(cpv2(t2-ts2));
end
%---pt 3---                
p3 = p2; %constant pressure heat rejection

t3 = ts2;

h3 = hf2;

s3 = sf2;

ts3 = XSteam('Tsat_p',p3);
%specific volume
v3 = XSteam('vL_p',p3); 
%---pt 4---  
p4 = p1;

s4 = s3;

sf4 = XSteam('sL_p',p4);

ts4 = XSteam('Tsat_p',p4);

% workdone by the pump   
wp = v3*(p4-p3)*100 ; 
% workdone by the turbine
wt = h1 - h2;

h4 = wp + h3;
%to find super heated temperature
t4 = (exp((s4-sf4)/cpv1))*ts4;
%net work output
wnet = wt - wp;
%heat input
qin = h1 - h4;
%Thermal efficiency :
efficiency = wnet*100 / qin;

%saturation line value
t = linspace(0,500,500);%temperature = t
for i = 1:length(t)
    hsl(i) = XSteam('hL_T',t(i));
    hsv(i) = XSteam('hV_T',t(i));
    ssl(i) = XSteam('sL_T',t(i));
    ssv(i) = XSteam('sV_T',t(i));
end

% plotting t-s graph
figure(1)
title('t-s diagram')
hold on
plot(ssl, t, 'R', 'linestyle', '--')
plot(ssv, t, 'R', 'linestyle', '--')
plot([s1,s2],[t1,t2],'g')
plot([s2,s3],[t2,t3],'g')
plot([s3,s4],[t3,t4],'g')
plot([s4,sf1],[t4,ts1],'g')
plot([sf1,sg1],[ts1,ts1],'g')
plot([sg1,s1],[ts1,t1],'g')
text(s1,t1,'1')
text(s2,t2,'2')
text(s3,t3,'3')
text(s4,t4,'4')
hold off
xlabel('entropy(s) in kj/kgk ----->')
ylabel('temperature(t) in degree celsius----->')

% plotting h-s graph
figure(2)
title('h-s diagram')
hold on
plot(ssl, hsl, 'R', 'linestyle', '--')
plot(ssv, hsv, 'R', 'linestyle', '--')
plot([s1,s2],[h1,h2],'g')
plot([s2,s3],[h2,h3],'g')
plot([s3,s4],[h3,h4],'g')
plot([s4,s1],[h4,h1],'g')
text(s1,h1,'1')
text(s2,h2,'2')
text(s3,h3,'3 4')
hold off
xlabel('entropy(s) in kj/kgk ----->')
ylabel('enthalpy(h) in kj/kg----->')
disp('-------------------------------------');
fprintf('Thermal efficiency :%f',efficiency); disp('%');
fprintf('Net work output :%f kj/kg\n',wnet);
fprintf('tubrine output :%f kj/kg\n',wt);
fprintf('pump input :%f kj/kg\n',wp);disp('----------------------------');
disp('At state point 1');
fprintf('h1 : %f kj/kg\n',h1)
fprintf('p1 : %f bar\n',p1);
fprintf('t1 : %f celsius\n',t1);
fprintf('s1 : %f kj/kgk\n',s1);disp('------------------------');
disp('At state point 2');
fprintf('h2 : %f kj/kg\n',h2)
fprintf('p2 : %f bar\n',p2);
fprintf('t2 : %f celsius\n',t2);
fprintf('s2 : %f kj/kgk\n',s2);disp('------------------------');
disp('At state point 3');
fprintf('h3 : %f kj/kg\n',h3)
fprintf('p3 : %f bar\n',p3);
fprintf('t3 : %f celsius\n',t3);
fprintf('s3 : %f kj/kgk\n',s3);disp('------------------------');
disp('At state point 4');
fprintf('h4 : %f kj/kg\n',h4)
fprintf('p4 : %f bar\n',p4);
fprintf('t4 : %f celsius\n',t4);
fprintf('s4 : %f kj/kgk\n',s4);disp('------------------------');

