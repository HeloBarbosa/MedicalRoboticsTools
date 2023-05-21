function position = position(entradas)

global l1 l2 

q1=entradas(1);
q2=entradas(2);

theta=[q1;q2];
position=forward_kinematics(theta, l1, l2);

end