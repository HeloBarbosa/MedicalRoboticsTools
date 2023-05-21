function tau_c = tau_c(entradas)

X = [entradas(1); entradas(2)];
Yd = entradas(3);
dq = [entradas(4); entradas(5)]; 
q = [entradas(6); entradas(7)];

dX=(jacobiano_end_effector(q))*dq;
g=[0;-9.8];

gravity=gravity_numeric(q,g);
jacob=jacobiano_end_effector(q);
Xd=Yd;
Kp = [0 0; 0 200];  
Kd = [10 0;0 10];     %amortecimento em x e y
Xe = [0.25; Xd];   % posiçao do osso
Ke = [2000 0; 0 0]; %stiffness do osso
F_phys=[10;0];

if (X(1) >= 0.25)
    
        Fe = (Ke)*(X-Xe);
    
else
    %onde não há osso
    Fe = [0;0];
end

tau_c=transpose(jacob)*(Kp*(Xd-X) - Kd*dX) - transpose(jacob)*Fe + gravity + transpose(jacob)*F_phys ;

end