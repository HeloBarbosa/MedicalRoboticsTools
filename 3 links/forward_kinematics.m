function forward_kinematics = forward_kinematics(entradas)

q=[entradas(1);entradas(2);entradas(3)];
q1=q(1);
q2=q(2);
q3=q(3);

global l1 l2 l3

eixo_x = l1*cos(q1) + l2*cos(q1+q2) + l3*cos(q1+q2+q3);
eixo_y = l1*sin(q1) + l2*sin(q1+q2) + l3*sin(q1+q2+q3);

forward_kinematics = [eixo_x;eixo_y];

end
