function [K,x] = forward_kinematics(q)


t1 = q(1);
d1 = q(2);
t2 = q(3);


a1 = 0.15;
a2 = 0.4;
a3 = 0.3;
a4 = 0.16;


% wrt frame 0
K = [[cos(t1)*cos(t2), -cos(t1)*sin(t2), -sin(t1),      a2*cos(t1) + a4*cos(t1)*cos(t2)]
    [        sin(t2),          cos(t2),        0,                 a4*sin(t2) - d1 - a3]
    [cos(t2)*sin(t1), -sin(t1)*sin(t2),  cos(t1), a1 + a2*sin(t1) + a4*cos(t2)*sin(t1)]
    [              0,                0,        0,                                    1]];

pos = K(1:3, 4);
ori = rotm2eul(K(1:3,1:3), 'ZYZ')';

x = [pos; ori];

