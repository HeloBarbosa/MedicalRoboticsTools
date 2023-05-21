function robot=robot(entradas)

global fv

dq1=entradas(1);
dq2=entradas(2);

dq=[dq1;dq2];

tau1=entradas(3);
tau2=entradas(4);

tau=[tau1;tau2];
%tau=Jt*F

q1=entradas(5);
q2=entradas(6);

q=[q1;q2];

g=[0;-9.8];

massa=MassNumeric(q);
massa_inv=inv(massa);
grav=gravity_numeric(q,g);
cori=CoriolisNum(q,dq);

robot=massa_inv*(tau - grav - cori*dq - fv*dq);

end
