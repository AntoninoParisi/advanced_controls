function [B] = B_Lagrangian(q)


a1 = 0.15;


% B = [a1*cos(q)];
B = [a1*(1+cos(q))];