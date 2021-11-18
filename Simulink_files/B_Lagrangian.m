function [B] = B_Lagrangian(q)

t1 = q(1);
d1 = q(2);
t2 = q(3);


B = [[(725*cos(t1 - conj(t1))*((4*cos(t2))/25 + 2/5)*((32*cos(conj(t2)))/3125 + 16/625))/32 + 3/20,                                        0,                                                                                                                                                                                                                                           (27*2^(1/2)*cos(pi/4 + conj(t1)))/1600];
[                                                                                           0,                                      6/5,                                                                                                                                                                                                                                               -(3*cos(t1 - conj(t1))*cos(t2))/25];
[                                                            (27*2^(1/2)*cos(t1 + pi/4))/1600, -(3*cos(conj(t2))*cos(t1 - conj(t1)))/25, cos(conj(t1))*((171*cos(t1))/1600 + (27*sin(t1))/1600) + sin(conj(t1))*((27*cos(t1))/1600 + (3*sin(t1))/100) + (12*cos(conj(t2))*cos(t1 - conj(t1))^2*cos(t2))/625 + (12*cos(conj(t1))*sin(conj(t2))*cos(t1)*sin(t2))/625 + (12*sin(conj(t1))*sin(conj(t2))*sin(t1)*sin(t2))/625]];
 
end

