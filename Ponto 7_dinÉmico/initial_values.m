global m1 m2 l1 l2 lc1 lc2 fv q0 I1czz I2czz  end_effector1 end_effector2 traject_x traject_y Kd Kp 

m1=0.4;
m2=0.2;
l1=0.3;
l2=0.15;
lc1=l1/2;
lc2=l2/2;
fv=0.05;
q0=[pi/2; pi/4];

I1czz=(1/12)*m1*l1^2;
I2czz=(1/12)*m2*l2^2;

end_effector1=[];
end_effector2=[];

traject_x=[];
traject_y=[];

% Kd = 50;
% Kp = 100;

Kp=1000;
Kd=20; 