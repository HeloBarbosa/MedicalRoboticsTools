syms I1cxx I1cyy I1czz I2cxx I2cyy I2czz q1 q2 q dq dq1 dq2 m1 m2 l1 lc1 lc2  real

%Matriz de Inércia na forma numérica

matrix_num=[ m2*l1^2 + 2*m2*cos(q2)*l1*lc2 + m1*lc1^2 + m2*lc2^2 + I1czz + I2czz  m2*lc2^2 + l1*m2*cos(q2)*lc2 + I2czz;
                               m2*lc2^2 + l1*m2*cos(q2)*lc2 + I2czz                     m2*lc2^2 + I2czz];
                          

%Coriolis

derq1=diff(matrix_num,q1);
derq2=diff(matrix_num,q2);

dq_total=diff(matrix_num,q1)*dq1+diff(matrix_num,q2)*dq2

kq1=[dq1 dq2]*diff(matrix_num,q1);
kq2=[dq1 dq2]*diff(matrix_num,q2);

dq_tdM=[kq1;kq2];
%nesta matriz fazemos a multiplicação da transposta de q (sendo q=[q1 q2]) com as derivadas
%parciais de M em ordem a q1 e q2; 
%Na primeira linha da matriz fica kq1 e na segunda linha fica kq2

Cori=dq_total-0.5*dq_tdM;
disp(Cori)
%C(q,dq)
