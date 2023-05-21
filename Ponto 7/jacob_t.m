function jacob_t = jacob_t(entradas)

global l1 l2 
F=[entradas(1);entradas(2)];
q1=entradas(3);
q2=entradas(4);
q=[q1;q2];

% jacob=jacobiano_end_effector(q);
     jacob = [-l1*sin(q1)-l2*sin(q1+q2),...
    -l2*sin(q1+q2);...
    l1*cos(q1)+l2*cos(q1+q2),...
    l2*cos(q1+q2)];

jacob_t=((transpose(jacob))*F);

end