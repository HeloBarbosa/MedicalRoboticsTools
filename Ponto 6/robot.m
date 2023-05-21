function exit = robot(entradas)
 
global fv F

q1=entradas(1);
q2=entradas(2);
q=[q1;q2];

dq1=entradas(3);
dq2=entradas(4);
dq=[dq1;dq2];

g1=entradas(5);
g2=entradas(6);
g=[g1;g2];

jacobiano=jacobiano_end_effector(q);
massa=MassNumeric(q);
massa_inv=inv(massa);
grav=gravity_numeric(q,g);
cori=CoriolisNum(q,dq);

exit=massa_inv*((transpose(jacobiano))*F + grav - grav - cori*dq - fv*dq);

end
