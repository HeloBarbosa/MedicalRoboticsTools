function jacobiano_end_effector=jacobiano_end_effector(q)

global l1 l2 l3

q1=q(1);
q2=q(2);
q3=q(3);

jacobiano_end_effector=[-l1*sin(q1)-l2*sin(q1+q2),  -l2*sin(q1+q2)-l3*(sin(q1+q2+q3)), -l3*(sin(q1+q2+q3)); 
         l1*(cos(q1))+l2*(cos(q1+q2))+l3*(cos(q1+q2+q3)),   l2*(cos(q1+q2))+l3*(cos(q1+q2+q3)) , l3*(cos(q1+q2+q3))];
     
end