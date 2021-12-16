% J =
% [- a2*sin(t1) - a4*cos(t2)*sin(t1),  0,                         -a4*cos(t1)*sin(t2)]
% [                                0, -1, a4*cos(t2)*cos(t1)^2 + a4*cos(t2)*sin(t1)^2]
% [  a2*cos(t1) + a4*cos(t1)*cos(t2),  0,                         -a4*sin(t1)*sin(t2)]
% [                                0,  0,                                    -sin(t1)]
% [                               -1,  0,                                           0]
% [                                0,  0,                                     cos(t1)]



function [J] = jacobian(q)

t1 = q(1);
d1 = q(2);
t2 = q(3);

a1 = 0.15;
a2 = 0.4;
a3 = 0.3;
a4 = 0.16;

% wrt frame 0
J =   [[- a2*sin(t1) - a4*cos(t2)*sin(t1),  0,                         -a4*cos(t1)*sin(t2)]
        [                                0, -1,                     a4*cos(t2) + a4*cos(t2)]
        [  a2*cos(t1) + a4*cos(t1)*cos(t2),  0,                         -a4*sin(t1)*sin(t2)]
        [                                0,  0,                                    -sin(t1)]
        [                               -1,  0,                                           0]
        [                                0,  0,                                     cos(t1)]];

end
