function jacobian_c2 = jacobian_c2(q)

q1=q(1);
q2=q(2);

global lc2 l1

j_c2 = [ - lc2*sin(q1 + q2) - l1*sin(q1), -lc2*sin(q1 + q2);
  lc2*cos(q1 + q2) + l1*cos(q1),  lc2*cos(q1 + q2)];

jacobian_c2 = j_c2;
end