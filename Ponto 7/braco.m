function braco_robo = braco(entradas)

global lc1 l1 lc2 l2 end_effector1 end_effector2 traject_x traject_y

q1=entradas(3);
q2=entradas(4);

q=[q1;q2];

Xd=entradas(1);
Yd=entradas(2);

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

end_effector1 = [end_effector1 pl2_x];
end_effector2 = [end_effector2 pl2_y];

%Coordenadas de entrada
traject_x = [traject_x Xd];
traject_y = [traject_y Yd];

plot(traject_x, traject_y,'*y')
hold on
plot(x1,y1,x2,y2,end_effector1, end_effector2,':k')
xlim([-1 1]); 
ylim([-1 1]);
hold off

braco_robo=0;

end