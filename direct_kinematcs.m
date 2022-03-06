

% dh;



% fw_kinematics = dh_mtx()
% dh_mtx(dh_table_s)
syms t1 t2 d1
fw_kin_solved =     [cos(t1)*cos(t2), -cos(t1)*sin(t2), -sin(t1),        (2*cos(t1))/5 + (4*cos(t1)*cos(t2))/25;
                             sin(t2),          cos(t2),        0,                    (4*sin(t2))/25 - d1 - 3/10;
                     cos(t2)*sin(t1), -sin(t1)*sin(t2),  cos(t1), (2*sin(t1))/5 + (4*cos(t2)*sin(t1))/25 + 3/20;
                                   0,                0,        0,                                             1];
                                                             
%                                
% [cos(t1)*cos(t2), -cos(t1)*sin(t2), -sin(t1),      a2*cos(t1) + a4*cos(t1)*cos(t2)]
% [        sin(t2),          cos(t2),        0,                 a4*sin(t2) - d1 - a3]
% [cos(t2)*sin(t1), -sin(t1)*sin(t2),  cos(t1), a1 + a2*sin(t1) + a4*cos(t2)*sin(t1)]
% [              0,                0,        0,                                    1]
 