global m1 m2 l1 l2 l3 lc1 lc2 lc3 fv q0 I1czz I2czz  end_effector1 end_effector2 traject_x traject_y Kq Kp qdp 

m1=0.4;
m2=0.2;
l1=1;
l2=1;
l3=0.3;
lc1=l1/2;
lc2=l2/2;
lc3=l3/2;
fv=0.05;

q0=[pi/12; pi/3; pi/3];

I1czz=(1/12)*m1*l1^2;
I2czz=(1/12)*m2*l2^2;

end_effector1=[];
end_effector2=[];

traject_x=[];
traject_y=[];

Kp = 10;  
Kq = 10;
% 
% qdp = [pi/2; -pi/2; -pi/2];
% qdp = [0; -0; -0];
% Temos tb o caso de:

% Kp = 10
% Kq = 0;

%em que dq0 = 0

% e:

% Kp = 10, Kq = 10
qdp = [80*pi/180 ; -160*pi/180;  80*pi/180];




