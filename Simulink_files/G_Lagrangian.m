function [G] = G_Lagrangian(q)


t1 = q(1);
d1 = q(2);
t2 = q(3);

G = [- (2943*0.4*cos(t1))/250 - (2943*0.16*cos(t1)*cos(t2))/250,
                                                              0, 
                                 (981*0.16*sin(t1)*sin(t2))/250];
 
end

