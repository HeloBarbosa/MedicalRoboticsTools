function forward_kinematics = forward_kinematics(q1,q2,p1,p2)

eixo_x = p1*cos(q1) + p2*cos(q1+q2);
eixo_y = p1*sin(q1) + p2*sin(q1+q2);

forward_kinematics = [eixo_x;eixo_y];

end
