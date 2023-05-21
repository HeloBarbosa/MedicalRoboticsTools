function plot_trajetoria=plot_trajetoria(entradas)

global l1 l2 l3 lc3 lc1 lc2 end_effector1 end_effector2

q1 = entradas(1);
q2 = entradas(2);
q3 = entradas(3);

q=[q1;q2;q3];

%origem
p1=0;
p2=0;%posições iniciais
p3=0;
origem=fw_k(q,p1,p2,p3);
origem_x=origem(1);
origem_y=origem(2);

%centro de massa do link 1
p1=lc1;
p2=0;
p3=0;
plc1=fw_k(q,p1,p2,p3);
plc1_x=plc1(1);
plc1_y=plc1(2);

%end-effector link 1
p1=l1;
p2=0;
p3=0;
pl1=fw_k(q,p1,p2,p3);
pl1_x=pl1(1);
pl1_y=pl1(2);

%centro de massa do link 2
p1=l1;
p2=lc2;
p3=0;
plc2=fw_k(q,p1,p2,p3);
plc2_x=plc2(1);
plc2_y=plc2(2);

%end-effector do link 2
p1=l1;
p2=l2;
p3=0;
pl2=fw_k(q,p1,p2,p3);
pl2_x=pl2(1);
pl2_y=pl2(2);

%centro de massa do link 2
p1=l1;
p2=l2;
p3=lc3;
pc3=fw_k(q,p1,p2,p3);
pc3_x=pc3(1);
pc3_y=pc3(2);

%end-effector do link 3
p1=l1;
p2=l2;
p3=l3;
pl3=fw_k(q,p1,p2,p3);
pl3_x=pl3(1);
pl3_y=pl3(2);

%1º link - origem, centro de massa do link 1, ponta do link 1
x1 =[origem_x, plc1_x, pl1_x];
y1= [origem_y, plc1_y, pl1_y];

%2º link - ponta do link 1, centro de massa do link 2, ponta do link 2
x2 = [pl1_x, plc2_x, pl2_x];
y2 = [pl1_y, plc2_y, pl2_y];

%3º link - ponta do link 2, centro de massa do link 3, ponta do link 3

x3 = [pl2_x, pc3_x, pl3_x];
y3 = [pl2_y, pc3_y, pl3_y];

end_effector1 = [end_effector1 pl3_x];
end_effector2 = [end_effector2 pl3_y];

R1x = l1*cos(q1); %p0
R1y = l1*sin(q1);

R2x = l2*cos(q1+q2) + R1x; %p_l1
R2y = l2*sin(q1+q2) + R1y;

R3x = l3*cos(q3+q2+q1) + R2x; %p_l2
R3y = l3*sin(q3+q2+q1) + R2y;


plot(0, 0, 'ok')
plot([0; R1x], [0;R1y],'-r')
hold on
plot([R1x;R2x], [R1y;R2y], '-b')
hold on
plot([R2x;R3x],[R2y;R3y], '-c')

xlim([-3 3]); 
ylim([-3 3]);

xCenter = 0.5;
yCenter = -1.5;
theta = 0 : 0.01 : 2*pi;
radius = 0.8;
x = radius * cos(theta) + xCenter;
y = radius * sin(theta) + yCenter;
fill(x, y, 'r');


plot_trajetoria=0;
end