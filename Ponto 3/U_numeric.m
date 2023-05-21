function U_numeric = U_numeric(g)

global m1 m2 lc1 lc2


U_numeric=[- g2*m2*(R2y + lc2*sin(q1 + q2)) - g1*m2*(lc2*cos(q1 + q2) + lc1*cos(q1)) - g1*lc1*m1*cos(q1) - g2*lc1*m1*sin(q1)];


end

