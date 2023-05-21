function tau_din=tau_din(entradas)

global Kd Kp 

q=[entradas(1);entradas(2)];
dq=[entradas(3);entradas(4)];
Xd_minus_X=([entradas(5);entradas(6)])*Kp;
dXd_minus_dX=([entradas(7);entradas(8)])*Kd;

g=[0;-9.8];

jacob=jacobiano_end_effector(q);
dif_jacob=der_jacob_ee(q);
inv_jacob=inv(jacob);                %2x2
massa = MassNumeric(q);              %2x2
gravity=gravity_numeric(q,g);        %1x2
cori=CoriolisNum(q,dq);              %2x2
w=Xd_minus_X + dXd_minus_dX;         %1x2
dj_dq=dif_jacob*dq;                  %1x2     
tau_din = (massa*inv_jacob*(w-dj_dq)) + cori*dq + gravity;

end
