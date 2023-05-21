% Mass Matrix computation of of a 2-link planar arm

syms q dq q1 dq1 q2 dq2 m1 m2real
syms l1 l2 lc1 lc2 I1c I1cxx I1cyy I1czz I2c I2cxx I2cyy I2czz real
% global m1 m2 l1 lc1 lc2

I1c = [I1cxx 0 0;0 I1cyy 0; 0 0 I1czz]; % Inertia tensors referred to the center of mass
I2c = [I2cxx 0 0;0 I2cyy 0; 0 0 I2czz];


% symbolic variables

q=[q1;q2];
dq=[dq1;dq2];

% Jacobians referred to the center of mass

Jvc1 = [-lc1*sin(q1) 0; lc1*cos(q1) 0;0 0];

Jvc2 = [-l1*sin(q1)-lc2*sin(q1+q2),  -lc2*sin(q1+q2); 
         l1*cos(q1)+lc2*cos(q1+q2),   lc2*cos(q1+q2); 0 0];
    
Jw1=[0 0;0 0;1 0];
Jw2=[0 0;0 0;1 1];
    
R1=[cos(q1) -sin(q1) 0; sin(q1) cos(q1) 0; 0 0 1]; % rotation matrices associated to each coordinate frame (rotation along z)
R2=[cos(q1+q2) -sin(q1+q2) 0; sin(q1+q2) cos(q1+q2) 0; 0 0 1];
    
MassSymb = simplify(m1*Jvc1'*Jvc1 +Jw1'*R1*I1c*R1'*Jw1  +m2*Jvc2'*Jvc2  + Jw2'*R2*I2c*R2'*Jw2);
disp(MassSymb)

