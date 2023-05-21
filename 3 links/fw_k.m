function fw_k = fw_k(q,p1,p2,p3)

q1=q(1);
q2=q(2);
q3=q(3);

eixo_x = p1*cos(q1) + p2*cos(q1+q2) + p3*cos(q1+q2+q3);
eixo_y = p1*sin(q1) + p2*sin(q1+q2) + p3*sin(q1+q2+q3);

fw_k = [eixo_x;eixo_y];

end