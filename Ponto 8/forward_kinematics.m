function forward_kinematics = forward_kinematics(q,p1,p2)

eixo_x = p1*cos(q(1)) + p2*cos(q(1)+q(2));
eixo_y = p1*sin(q(1)) + p2*sin(q(1)+q(2));

forward_kinematics = [eixo_x;eixo_y];

end
