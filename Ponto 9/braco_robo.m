function braco_robo = braco_robo(entradas)

global l1 l2 lc2 lc1 end_effector1 end_effector2 Xe

q=[entradas(1);entradas(2)];
q1=q(1);
q2=q(2);
 
%origem
p1=0;
p2=0;%posições iniciais
origem=forward_kinematics(q1,q2,p1,p2);
origem_x=origem(1);
origem_y=origem(2);

%centro de massa do link 1
p1=lc1;
p2=0;
plc1=forward_kinematics(q1,q2,p1,p2);
plc1_x=plc1(1);
plc1_y=plc1(2);

%end-effector link 1
p1=l1;
p2=0;
pl1=forward_kinematics(q1,q2,p1,p2);
pl1_x=pl1(1);
pl1_y=pl1(2);

%centro de massa do link 2
p1=l1;
p2=lc2;
plc2=forward_kinematics(q1,q2,p1,p2);
plc2_x=plc2(1);
plc2_y=plc2(2);

%end-effector do link 2
p1=l1;
p2=l2;
pl2=forward_kinematics(q1,q2,p1,p2);
pl2_x=pl2(1);
pl2_y=pl2(2);

%1º link - origem, centro de massa do link 1, ponta do link 1
x1 =[origem_x, pl1_x];
y1= [origem_y, pl1_y];

%2º link - ponta do link 1, centro de massa do link 2, ponta do link 2
x2 = [pl1_x, pl2_x];
y2 = [pl1_y, pl2_y];

end_effector1 = [end_effector1 pl2_x];
end_effector2 = [end_effector2 pl2_y];

xCenter = 0.55;
yCenter = 0.25;
theta = pi/2 : 0.01 : 3*pi/2;
radius = 0.25;
x = radius * cos(theta) + xCenter;
y = radius * sin(theta) + yCenter;
fill(x, y, 'w');
hold on
linha_horizontal = [ [0 0.6]', Xe(2)*ones(2,1)];
barreira_osso = [Xe(1)*[1;1], [-0.1;0.6]];
plot(linha_horizontal(:,1),linha_horizontal(:,2),'c');
plot(barreira_osso(:,1), barreira_osso(:,2), 'y');
hold on
plot(x1,y1,'b',x2,y2,'r',end_effector1 ,end_effector2,':k','linewidth',2)

xlim([-0.2 0.8]); 
ylim([-0.4 0.8]);

hold off

braco_robo=0;

% end

end