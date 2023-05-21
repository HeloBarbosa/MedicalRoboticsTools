function jacobian_c1 = jacobian_c1(q)

global lc1 

q1=q(1);


j_c1 = [ -lc1*sin(q1), 0;
 lc1*cos(q1), 0];

jacobian_c1=j_c1;

end