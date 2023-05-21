function derivative_position=derivative_position(entradas)

global l1 l2 

q1=entradas(1);
q2=entradas(2);
dq1=entradas(3);
dq2=entradas(4);
dq=[dq1;dq2];

% jacob=jacobiano_end_effector(q);
jacob=[-l1*sin(q1)-l2*sin(q1+q2),  -l2*sin(q1+q2); 
         l1*cos(q1)+l2*cos(q1+q2),   l2*cos(q1+q2)];

derivative_position=jacob*dq;

end