clear all
close all
clc
%length of arms
l1 = 2;
l2 = 1;
theta2 = linspace(0,90,10);
theta1 = linspace(0,90,10);
ct=1;
for i = 1:length(theta1)
    Theta1 = theta1(i);
    for j = 1:length(theta2)
        Theta2 = theta2(j);
        %fixed point of arm 1
        y0 = 0;
        x0 = 0;
        % position for arm 1
        x1 = l1*cosd(Theta1);
        y1 = l1*sind(Theta1);
        %position of arm 2
        x2 = x1 + (l2*cosd(Theta2));
        y2 = y1 + (l2*sind(Theta2));
        %plot
        plot([x0 x1],[y0 y1],[x1 x2],[y1 y2],'linewidth',4)
        axis([-0.1 3 0 4]);
        pause(0.03)
        M(ct)= getframe(gcf);
        ct=ct+1;

    end
end

movie(M)
videofile = VideoWriter('two_arm_robot.avi','Uncompressed AVI');
open(videofile)
writeVideo(videofile,M)
close(videofile)