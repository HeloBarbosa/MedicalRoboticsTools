syms q1 q2 dq1 dq2 l1 l2 lc1 lc2

%End-effector

eixo_x = l1*cos(q1) + l2*cos(q1+q2);
eixo_y = l1*sin(q1) + l2*sin(q1+q2);


X=[eixo_x;eixo_y]

%End-effector 1

eixo_x1 = l1*cos(q1);
eixo_y1 = l1*sin(q1);


X1=[eixo_x1;eixo_y1]

%End-effector 2

eixo_x2 = l1*cos(q1) + l2*cos(q1+q2);
eixo_y2 = l1*sin(q1) + l2*sin(q1+q2);


X2=[eixo_x2;eixo_y2]


%-------------------------------------------
%Eixos centro 1

eixo_xc1 = lc1*cos(q1);
eixo_yc1 = lc1*sin(q1);

X_c1=[eixo_xc1;eixo_yc1]

%-------------------------------------------
%Eixos centro 2

eixo_xc2 = l1*cos(q1)+ lc2*cos(q1+q2);
eixo_yc2 =  l1*sin(q1)+ lc2*sin(q1+q2);

X_c2=[eixo_xc2;eixo_yc2]