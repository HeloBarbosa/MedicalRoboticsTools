function forward_kinematics = forward_kinematics(q,p1,p2)

q=[q(1);q(2)];
q1=q(1);
q2=q(2);

eixo_x = p1*cos(q1) + p2*cos(q1+q2);
eixo_y = p1*sin(q1) + p2*sin(q1+q2);

forward_kinematics = [eixo_x;eixo_y];

end
