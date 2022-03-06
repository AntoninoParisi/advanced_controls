% J =
% [- a2*sin(t1) - a4*cos(t2)*sin(t1),  0,                         -a4*cos(t1)*sin(t2)]
% [                                0, -1, a4*cos(t2)*cos(t1)^2 + a4*cos(t2)*sin(t1)^2]
% [  a2*cos(t1) + a4*cos(t1)*cos(t2),  0,                         -a4*sin(t1)*sin(t2)]
% [                                0,  0,                                    -sin(t1)]
% [                               -1,  0,                                           0]
% [                                0,  0,                                     cos(t1)]



function [J_dot] = jacobian_dot(q,dq)

t1 = q(1);
d1 = q(2);
t2 = q(3);

dt1 = dq(1);
dd1 = dq(2);
dt2 = dq(3);

a1 = 0.15;
a2 = 0.4;
a3 = 0.3;
a4 = 0.16;


J11 = a4*sin(t1)*sin(t2)*dt2 - a4*cos(t1)*cos(t2)*dt1 - a2*cos(t1)*dt1;
J13 = a4*sin(t1)*sin(t2)*dt1 - a4 * cos(t1)*cos(t2)*dt2;
J23 = -a4*sin(t2)*dt2;
J31 = -a2*sin(t1)*dt1 - a4*cos(t2)*sin(t1)*dt1 - a4 * cos(t1)*sin(t2)*dt2;
J33 = -a4 * cos(t1) * sin(t2) * dt1 - a4 * cos(t2)*sin(t1)*dt2;
J43 = -cos(t1)*dt1;
J63 = - sin(t1)*dt1;


% wrt frame 0
J_dot = zeros(6,3);

J_dot(1,1) = J11;
J_dot(1,3) = J13;
J_dot(2,3) = J23;
J_dot(3,1) = J31;
J_dot(3,3) = J33;
J_dot(4,3) = J43;
J_dot(6,3) = J63;


end
