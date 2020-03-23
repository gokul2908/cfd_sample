
 theta = linspace(180,0,179)
 %engine specs
 stroke = 0.1;
 con_rod = 0.15;
 bore = 0.1;
 cr = 8;
 a = stroke/2
 r = con_rod/a
 v_s =(pi/4)*bore^2*stroke;
 v_c = v_s/(cr-1);
 v = (1+(0.5*(cr-1))*(r+1-cosd(theta))-((r^2-sind(theta).^2).^0.5)).*v_c;
 plot(theta,v)