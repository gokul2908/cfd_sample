
function[v] = piston_kinematics(stroke,con_rod,bore,cr,startcrank_angle,endcrank_angle)
theta = linspace(startcrank_angle,endcrank_angle,179);
a = stroke/2;
r = con_rod/a;
v_s =(pi/4)*bore^2*stroke;
v_c = v_s/(cr-1);
t1 = 0.5*(cr-1);
t2 = r+1-cosd(theta);
t3 = (r^2-sind(theta).^2).^0.5;
v = (1+t1*(t2-t3)).*v_c;
end