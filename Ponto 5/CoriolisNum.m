function CoriolisNum = CoriolisNum (q, dq)

global l1 lc2 m2 

q2=q(2);   %posição 
dq1=dq(1);
dq2=dq(2); %velocidade


CoriolisNum=[                          -2*dq2*l1*lc2*m2*sin(q2),    -dq2*l1*lc2*m2*sin(q2);
            dq1*l1*lc2*m2*sin(q2) - (dq2*l1*lc2*m2*sin(q2))/2, (dq1*l1*lc2*m2*sin(q2))/2];


end

