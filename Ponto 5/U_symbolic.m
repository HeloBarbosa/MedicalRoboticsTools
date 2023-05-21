syms q g g1 g2 g1 g2 q1 q2 m m1 m2 lc lc1 lc2 r1 r2 r R1x R1y R2x R2y R1 R2 l1 real

g=[g1;g2];

R1x = lc1*cos(q1);
R1y = lc1*sin(q1);

R2x = l1*cos(q1) + lc2*cos(q1+q2);
R2y = l1*sin(q1) + lc2*sin(q1+q2);

R1=[R1x;R1y];
R2=[R2x;R2y];
                         
termo1=(-m1*transpose(R1)*g)
termo2=(-m2*transpose(R2)*g)

U_symbol=termo1+termo2

dif1=diff(U_symbol,q1)
dif2=diff(U_symbol,q2)

grav=[dif1;dif2]




