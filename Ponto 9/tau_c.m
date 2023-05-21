function tau_c = tau_c(entradas)

global Kp Kd Xe Ke g Fe

X = [entradas(1); entradas(2)];
Xd = [entradas(3); entradas(4)];
dX = [entradas(5); entradas(6)];
q = [entradas(7); entradas(8)];
dq = [entradas(9); entradas(10)]; 
dXd = [entradas(11);entradas(12)];
F_phys=[entradas(13);entradas(14)];  %considera-se oscilação em yy

%F_phys = [10;0]; %não se considera oscilação em yy

if (X(1) >= 0.30)
      
    Fe = Ke*(X-Xe)

else
    
    Fe = [0;0];
end

D = Kd;
K = Kp;

mass=MassNumeric(q);
inv_mass=inv(mass);
cori=CoriolisNum(q,dq);
gravity = gravity_numeric(q,g);
jacob = jacobiano_end_effector(q); %2x2
transp_j = jacob';
inv_jacob = inv(jacob);
dJ_dq = dJ_dqNum(q,dq);

A_inv = jacob*inv_mass*transp_j;
w = A_inv*(D*(dXd - dX)+ K*(Xd - X) - Fe);  

tau = ((mass*inv_jacob*(w-dJ_dq)) + cori*dq + gravity + transp_j*Fe + transp_j*F_phys); 
tau_c=tau;

end