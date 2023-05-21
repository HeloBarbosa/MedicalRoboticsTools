%dJ*dq 

syms dq1 dq2 q1 q2 l1 l2 

dq=[dq1;dq2];

dJ = [-dq1*(l2*cos(q1 + q2) + l1*cos(q1)) - dq2*l2*cos(q1 + q2), - dq1*l2*cos(q1 + q2) - dq2*l2*cos(q1 + q2);
    - dq1*(l2*sin(q1 + q2) + l1*sin(q1)) - dq2*l2*sin(q1 + q2), -dq1*l2*sin(q1 + q2) - dq2*l2*sin(q1 + q2)]

dJ*dq