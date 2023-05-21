global m1 m2 l1 l2 lc1 lc2 fv q1 q2 dq1 dq2 I1czz I2czz g end_effector1 end_effector2 traject_x traject_y Kd Kp Ke Xe Ke2

m1=0.4;
m2=0.2;
l1=0.3;
l2=0.15;
lc1=l1/2;
lc2=l2/2;
fv=0.05;

q1=pi/2;
q2=-pi/4;
q=[q1; q2];

dq1=0;
dq2=0;
dq=[dq1;dq2];

I1czz=(1/12)*m1*l1^2;
I2czz=(1/12)*m2*l2^2;

end_effector1=[];
end_effector2=[];

traject_x=[];
traject_y=[];

g=[0;-9.8];

Kd = [15 0;0 100];
Kp = [0 0;0 2000];
Ke = [200 0; 0 0];
%Ke2 = [0 0; 0 80];
Xe = [0.30; 0.25];  

