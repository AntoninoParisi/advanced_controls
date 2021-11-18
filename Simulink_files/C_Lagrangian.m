function [C] = C_Lagrangian(q, qD)


t1 = q(1);
d1 = q(2);
t2 = q(3);

Dt1 = qD(1);
Dt2 = qD(3);
Dd3 = qD(2);
a1 = 0.15;
a2 = 0.4;
a3 = 0.3;
a4 = 0.16;


C = [[- (29*cos(t1 - conj(t1))*sin(t2)*(a4*abs(a2)^2 + a2*cos(conj(t2))*abs(a4)^2))/(40*a2) - (29*sin(conj(t2))*cos(t1 - conj(t1))*abs(a4)^2*(a2 + a4*cos(t2)))/(40*a4),                                               0,                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     -(27*2^(1/2)*sin(pi/4 + conj(t1)))/3200];
[                                                                                                                                                                0,                                               0,                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         (3*a4*cos(t1 - conj(t1))*sin(t2))/8];
[                                                                                                                                -(27*2^(1/2)*sin(t1 + pi/4))/3200, (3*sin(conj(t2))*cos(t1 - conj(t1))*conj(a4))/8, (27*cos(conj(t1))*cos(t1))/800 - (3*2005^(1/2)*sin(atan(18/41) - 2*real(t1)))/3200 - (123*cos(conj(t1))*sin(t1))/1600 - (123*sin(conj(t1))*cos(t1))/1600 - (27*sin(conj(t1))*sin(t1))/800 - (3*cos(conj(t2))*cos(t1 - conj(t1))^2*abs(a4)^2*sin(t2))/8 - (3*sin(conj(t2))*cos(t1 - conj(t1))^2*abs(a4)^2*cos(t2))/8 + (3*cos(conj(t1))*cos(conj(t2))*abs(a4)^2*cos(t1)*sin(t2))/8 + (3*cos(conj(t1))*sin(conj(t2))*abs(a4)^2*cos(t1)*cos(t2))/8 + (3*cos(conj(t2))*sin(conj(t1))*abs(a4)^2*sin(t1)*sin(t2))/8 + (3*sin(conj(t1))*sin(conj(t2))*abs(a4)^2*cos(t2)*sin(t1))/8]];
end

