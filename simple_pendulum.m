clear all 
close all
clc

%input Parameters
b = 0.05;  % damping coefficient
g = 9.81;  % gravity 
l = 1;     % length of rod
m = 1;     % mass
x0 = 0;    % fixed points
y0 = 0;

% initial condition
theta_0 = [0 3];

%time points
t_span = linspace(0,20,200);

% solve ODE
[t, y] = ode45(@(t,theta) ode_func(theta,b,g,l,m), t_span, theta_0);

%plotting
figure(1)

subplot(2,1,1)
plot(t,y(:,1),'color','r')
xlabel('time')
ylabel('theta')

hold on 
subplot(2,1,2)
plot(t,y(:,2),'color','b')
xlabel('time')
ylabel('velocity')

theta = y(:,1);
ct = 1;

for i = 1:length(theta)
    x = theta(i);
    y1 = -l.*cos(x);
    x1 = l*sin(x);
    
    figure(2)
    hold on
    plot([x0 x1],[y0 y1],'color', 'r');
    plot(x1,y1,'-o','markersize',30,'markeredgecolor','r');
    axis([-1 1 -1 1]);
    pause(0.05);
    M(ct)= getframe(gcf);
    ct=ct+1; 
    clf()
end

movie(M);
videofile = VideoWriter('second_ode_pendulum.avi','uncompressed AVI');
open(videofile)
writeVideo(videofile,M)
close(videofile)
