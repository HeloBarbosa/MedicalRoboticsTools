function position = position(entradas)

global l1 l2 

q=[entradas(1);entradas(2)];
q1=q(1);
q2=q(2);

theta=[q1;q2];
position=forward_kinematics(theta, l1, l2);

end