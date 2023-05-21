function braco_robo = braco_robo(entradas)


global l1 l2 lc2 lc1 end_effector1 end_effector2 
q=[entradas(1);entradas(2)];

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

%plot osso
xCenter = 0.5;
yCenter = 0.25;
theta = pi/2 : 0.01 : 3*pi/2;
radius = 0.25;
x = radius * cos(theta) + xCenter;
y = radius * sin(theta) + yCenter;
fill(x, y, 'w');

hold on

%plot osso mole

x6Center = 0.5775;
y6Center = 0.25;
theta6 = pi/2 : 0.01 : 3*pi/2;
radius6 = 0.3;
x6 = radius6 * cos(theta6) + x6Center;
y6 = radius6 * sin(theta6) + y6Center;
fill(x6, y6, 'y');

%plot medula
x4Center = 0.4;
y4Center = 0.2;
theta = 0 : 0.01 : 2*pi;
radius = 0.03;
x4 = radius * cos(theta) + x4Center;
y4 = radius * sin(theta) + y4Center;
fill(x4, y4, 'r');

%plot braço
plot(x1,y1,x2,y2,end_effector1, end_effector2,':k')
xlim([-1 1]); 
ylim([-1 1]);

hold off

braco_robo=0;

end