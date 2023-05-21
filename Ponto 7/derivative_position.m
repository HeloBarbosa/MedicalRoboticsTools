function derivative_position=derivative_position(entradas)

dq1=entradas(1);
dq2=entradas(2);
dq=[dq1;dq2];

q1=entradas(3);
q2=entradas(4);
q=[q1;q2];

jacob=jacobiano_end_effector(q);
derivative_position=jacob*dq;

end