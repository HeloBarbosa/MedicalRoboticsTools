function MassNumeric = MassNumeric(q)

global m1 l1 lc1 lc2 I1czz I2czz

q2=q(2);

MassNumeric=[ l1^2/5 + (2*cos(q2)*l1*lc2)/5 + m1*lc1^2 + lc2^2/5 + I1czz + I2czz, lc2^2/5 + (l1*cos(q2)*lc2)/5 + I2czz;
                           lc2^2/5 + (l1*cos(q2)*lc2)/5 + I2czz,                      lc2^2/5 + I2czz];

end
