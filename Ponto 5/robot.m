function out = robot(entradas)
 
global fv

g=[entradas(1);entradas(2)];
q=[entradas(3);entradas(4)];
dq=[entradas(5);entradas(6)];

massa=MassNumeric(q);
massa_inv=inv(massa);
grav=gravity_numeric(q,g);
cori=CoriolisNum(q,dq);

tau=grav;

out=massa_inv*(tau - grav - cori*dq - fv*dq);

end
