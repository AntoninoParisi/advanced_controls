clear all
clc
syms t1 t2 d1 t real

syms a1 a2 a3 a4 real

t1(t) = symfun(str2sym('t1(t)'), t);
t2(t) = symfun(str2sym('t2(t)'), t);
d1(t) = symfun(str2sym('d1(t)'), t);




J11 = -a2*sin(t1(t)) - a4*cos(t2(t))*sin(t1(t))

dJ11dt = diff(J11,t)

%%
J12 = 0;

dJ12dt = diff(J12,t)

%%

J13 = -a4*cos(t1(t)*sin(t2(t)))

dJ13dt = diff(J13,t)





%%


J21 = 0;
dJ21dt = diff(J21,t)



%%


J22 = -1;

dJ22dt = diff(J22,t)


%%


J23 = a4*cos(t2(t))

dJ23dt = diff(J23,t)


%%

J31 = a2*cos(t1(t)) + a4*cos(t1(t))*cos(t2(t));

dJ31dt = diff(J31,t)


%%

J32 = 0;

dJ32dt = diff(J32,t)

%%
J33 = -a4*sin(t1(t))*sin(t2(t))

dJ33dt = diff(J33,t)

%%

J_analitycal(1,1) = dJ11dt;
J_analitycal(1,2) = dJ12dt;
J_analitycal(1,3) = dJ13dt;
J_analitycal(2,1) = dJ21dt;
J_analitycal(2,2) = dJ22dt;
J_analitycal(2,3) = dJ23dt;
J_analitycal(3,1) = dJ31dt;
J_analitycal(3,2) = dJ32dt;
J_analitycal(3,3) = dJ33dt;


 
% 
% [  a4*sin(t1(t))*sin(t2(t))*dt2 - a4*cos(t1(t))*cos(t2(t))*dt1 - a2*cos(t1(t))*dt1, 0, a4*sin(sin(t2(t))*t1(t))*(sin(t2(t))*dt1 + cos(t2(t))*t1(t)*dt2)]
% [                                                                                0, 0,                                               -a4*sin(t2(t))*dt2]
% [- a2*sin(t1(t))*dt1 - a4*cos(t2(t))*sin(t1(t))*dt1 - a4*cos(t1(t))*sin(t2(t))*dt2, 0,    - a4*cos(t1(t))*sin(t2(t))*dt1 - a4*cos(t2(t))*sin(t1(t))*dt2]
%  
% 











