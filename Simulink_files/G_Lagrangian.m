function [G] = G_Lagrangian(q, g)


t1 = q(1);
d1 = q(2);
t2 = q(3);

G = [- (10791*cos(t1))/1250 - (10791*cos(t1)*cos(t2))/3125, 0, (6867*sin(conj(t1))*sin(t2))/6250]';
 
end

