function dqd=trajectory(entradas)

global Kp Kq qdp l1 l2 l3

Xd=[entradas(1);entradas(2)];
q=[entradas(3);entradas(4);entradas(5)];
% X=[entradas(6);entradas(7)];
X=fw_k(q,l1,l2,l3);
jacob=jacobiano_end_effector(q);

%J#=JT*inv(JJT)
generalized_inverse_j=transpose(jacob)*inv(jacob*transpose(jacob));

%dq=J#[Kp(Xd-X)]
% dq_traj=generalized_inverse_j*(Kp*(Xd-X));

% dXd = Kp(Xd ? X)  - slide 147
dXd=Kp*(Xd - X);

% dq0 = Kq(qdp ? q) - slide 148
dq0=Kq*(qdp - q);

% qdp: desired posture - deve ser definido nos valores iniciais
% dqd = J#*dXd + (I - J#J)dq0 

I = eye(3);
dqd = generalized_inverse_j*dXd + (I - generalized_inverse_j*jacob)*dq0;

% qd - desired joint position


end