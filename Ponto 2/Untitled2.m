syms q1 q2 l2 l1 lc1 lc2


p1=lc1;
p2=0;
X_c1 =  [ lc1*cos(q1)
 lc1*sin(q1)];

% derq1=diff(matrix_num,q1);
% derq2=diff(matrix_num,q2);
J_c1_q1 = diff(X_c1,q1)
J_c1_q2 = diff(X_c1,q2)

J_c1 = [J_c1_q1, J_c1_q2]

%-------------------------------------

p1=l1;
p2=lc2;
X_c2 =  [  lc2*cos(q1 + q2) + l1*cos(q1)
lc2*sin(q1 + q2) + l1*sin(q1) ];

% derq1=diff(matrix_num,q1);
% derq2=diff(matrix_num,q2);
J_c2_q1 = diff(X_c2,q1)
J_c2_q2 = diff(X_c2,q2)

J_c2 = [J_c2_q1, J_c2_q2]

%---------------------------------------------------------------
X_ee1= [ l1*cos(q1);
 l1*sin(q1)];

J_ee1_q1 = diff(X_ee1,q1)
J_ee1_q2 = diff(X_ee1,q2)

Jee1 = [J_ee1_q1,J_ee1_q2]


X_ee2= [l2*cos(q1 + q2) + l1*cos(q1);
 l2*sin(q1 + q2) + l1*sin(q1)];

J_ee2_q1 = diff(X_ee2,q1)
J_ee2_q2 = diff(X_ee2,q2)

Jee2 = [J_ee2_q1,J_ee2_q2]
