function tau_c = tau_c(entradas)
global l1 l2 lc1 lc2
 
X = [entradas(1); entradas(2)];

Yd = entradas(3);
dq = [entradas(4); entradas(5)]; 
q = [entradas(6); entradas(7)];
turnvalue = entradas(8);

dX=(jacobiano_end_effector(q))*dq;
g=[0;-9.8];

gravity=gravity_numeric(q,g);
jacob=jacobiano_end_effector(q);
Xd=Yd;
Kp = [0 0; 0 700];  
Kd = [10 0;0 10];     %amortecimento em x e y


Xe = [0.25; Xd];   % posiçao do osso
Ke = [300 0; 0 0]; %stiffness do osso

Xe1 = [0.28; Xd];   % posiçao do osso mole
Ke1 = [100 0; 0 0]; %stiffness do osso mole


F_phys=[10;0];

%origem
p1=0;
p2=0;%posições iniciais
origem=forward_kinematics(q,p1,p2);
origem_x=origem(1);
origem_y=origem(2);

%centro de massa do link 1
p1=lc1;
p2=0;
plc1=forward_kinematics(q,p1,p2);
plc1_x=plc1(1);
plc1_y=plc1(2);

%end-effector link 1
p1=l1;
p2=0;
pl1=forward_kinematics(q,p1,p2);
pl1_x=pl1(1);
pl1_y=pl1(2);

%centro de massa do link 2
p1=l1;
p2=lc2;
plc2=forward_kinematics(q,p1,p2);
plc2_x=plc2(1);
plc2_y=plc2(2);

%end-effector do link 2
p1=l1;
p2=l2;
pl2=forward_kinematics(q,p1,p2);
pl2_x=pl2(1);
pl2_y=pl2(2);

%1º link - origem, centro de massa do link 1, ponta do link 1
x1 =[origem_x, plc1_x, pl1_x];
y1= [origem_y, plc1_y, pl1_y];

%2º link - ponta do link 1, centro de massa do link 2, ponta do link 2
x2 = [pl1_x, plc2_x, pl2_x];
y2 = [pl1_y, plc2_y, pl2_y];


if (turnvalue==-1)
    % fazer o robo voltar
    Kp = [0 0; 0 -10];
    Kd = [3 0; 0 65];
    F_phys=[-17;0];
end

if (X(2)~=0.2 && X(1)>=0)
    Kd=[10 0; 0 20];
end
if (X(2)~=0.2 && X(1)>=0.1)
    Kd=[10 0; 0 40];
end
if (X(2)~=0.2 && X(1)>=0.15)
    Kd=[10 0; 0 80];
end
if (X(2)~=0.2 && X(1)>=0.2)
    Kd=[10 0; 0 100];
end


if (F_phys(1)>10)
    
    F_phys=[0;0];
    Kp = [0 0; 0 0];  
    
  %Se a força do médico for maior do que é suposto, o robô não deve se
  %mexer.
end
     
    
if (X(1) >= 0.25 && X(1) <0.28)
        Fe = (Ke)*(X-Xe);
   

elseif (X(1) >=0.28) %força osso mole
    Fe=(Ke1)*(X-(Xe1));
    

else
    %onde não há osso
    Fe = [0;0];
 
end

if (X(1)<=-0.1 && turnvalue==-1)
    F_phys=[0;0];
    Kp = [0 0; 0 0];  
    Kd = [200 0;0 200]; 
end

tau_c=(transpose(jacob)*(Kp*(Xd-X) - Kd*dX) - transpose(jacob)*Fe + gravity + transpose(jacob)*F_phys);



end