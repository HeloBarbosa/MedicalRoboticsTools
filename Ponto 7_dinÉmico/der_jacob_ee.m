function der_jacob_ee = der_jacob_ee(q)

global l1 l2 

q1=q(1);
q2=q(2);

der_jacob_ee= [ - l2*cos(q1 + q2) - l1*cos(q1), -l2*cos(q1 + q2);
 - l2*sin(q1 + q2) - l1*sin(q1), -l2*sin(q1 + q2)];

end