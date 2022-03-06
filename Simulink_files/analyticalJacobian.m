% JA =
%       [[                       -a2*sin(t1),  0,                         -a4*cos(t1)*sin(t2)]
%         [                                0, -1,                                  a4*cos(t2)]
%         [                       a2*cos(t1),  0,                         -a4*sin(t1)*sin(t2)]
%         [                                0,  0,                                    -sin(t1)]
%         [                               -1,  0,                                           0]
%         [                                0,  0,                                     cos(t1)]]


function [JA] = analyticalJacobian(q)

t1 = q(1);
d1 = q(2);
t2 = q(3);


a1 = 0.15;
a2 = 0.4;
a3 = 0.3;
a4 = 0.16;


% wrt frame 0
J = jacobian(q);
K = [[cos(t1)*cos(t2), -cos(t1)*sin(t2), -sin(t1),      a2*cos(t1) + a4*cos(t1)*cos(t2)]
    [        sin(t2),          cos(t2),        0,                 a4*sin(t2) - d1 - a3]
    [cos(t2)*sin(t1), -sin(t1)*sin(t2),  cos(t1), a1 + a2*sin(t1) + a4*cos(t2)*sin(t1)]
    [              0,                0,        0,                                    1]];

phi = rotm2eul(K(1:3,1:3),'ZYZ');

JA = T_analytical(phi)*J;


 
% [- (2*sin(t1))/5 - (4*cos(t2)*sin(t1))/25,  0,                            -(4*cos(t1)*sin(t2))/25]
% [                                       0, -1,                                     (4*cos(t2))/25]
% [  (2*cos(t1))/5 + (4*cos(t1)*cos(t2))/25,  0,                            -(4*sin(t1)*sin(t2))/25]
% [        (cos(theta)*sin(phi))/sin(theta),  0, cos(t1) + (cos(phi)*cos(theta)*sin(t1))/sin(theta)]
% [                               -cos(phi),  0,                                   sin(phi)*sin(t1)]
% [                    -sin(phi)/sin(theta),  0,                     -(cos(phi)*sin(t1))/sin(theta)]


end
