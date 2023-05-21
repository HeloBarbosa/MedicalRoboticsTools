function out = robot(entradas)
 
global fv

tau1=entradas(1);
tau2=entradas(2);
tau=[tau1;tau2];

q1=entradas(3);
q2=entradas(4);

q=[q1;q2];

dq1=entradas(5);
dq2=entradas(6);

dq=[dq1;dq2];

g1=entradas(7);
g2=entradas(8);
g=[g1;g2];

massa=MassNumeric(q);
massa_inv=inv(massa);
grav=gravity_numeric(q,g);
cori=CoriolisNum(q,dq);

out=massa_inv*(tau - grav - cori*dq - fv*dq);

end
