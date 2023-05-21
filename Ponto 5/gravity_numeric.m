function gravity_numeric = gravity_numeric(q,g)

global m1 m2 lc1 lc2 l1 

q1=q(1);
q2=q(2);
g1=g(1);
g2=g(2);

gravity_numeric = [g1*m2*(lc2*sin(q1 + q2) + l1*sin(q1)) - g2*m2*(lc2*cos(q1 + q2) + l1*cos(q1)) - g2*lc1*m1*cos(q1) + g1*lc1*m1*sin(q1);
                                                                       g1*lc2*m2*sin(q1 + q2) - g2*lc2*m2*cos(q1 + q2)];
end
