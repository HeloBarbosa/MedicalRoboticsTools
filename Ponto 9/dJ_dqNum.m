function dJ_dqNum = dJ_dqNum(q,dq)

global l1 l2 

dq1=dq(1);
dq2=dq(2);
q1=q(1);
q2=q(2);

dJ_dqNum = [- dq1*(dq1*(l2*cos(q1 + q2) + l1*cos(q1)) + dq2*l2*cos(q1 + q2)) - dq2*(dq1*l2*cos(q1 + q2) + dq2*l2*cos(q1 + q2));
 - dq1*(dq1*(l2*sin(q1 + q2) + l1*sin(q1)) + dq2*l2*sin(q1 + q2)) - dq2*(dq1*l2*sin(q1 + q2) + dq2*l2*sin(q1 + q2))];


end