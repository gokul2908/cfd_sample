
function[v] = piston_kinematics(stroke,con_rod,bore,cr,startcrank_angle,endcrank_angle)
a = stroke/2
r = con_rod/a
theta = (startcrank_angle:endcrank_angle)
v_s =(pi/4)*bore^2*stroke;
v_c = v_s/(cr-1);
v = (1+(0.5*(cr-1))*(r+1-cosd(theta))-((r^2-sind(theta).^2).^0.5));
end