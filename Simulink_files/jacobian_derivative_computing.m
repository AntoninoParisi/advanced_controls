clear all
clc
syms t1 t2 d1 t

syms a1 a2 a3 a4

t1(t) = symfun(str2sym('t1(t)'), t);
t2(t) = symfun(str2sym('t2(t)'), t);
d1(t) = symfun(str2sym('d1(t)'), t);



J11 = - a2*sin(t1(t)) - a4*cos(t2(t))*sin(t1(t));

dJ11dt = diff(J11,t)

%%
J13 = -a4*cos(t1(t))*sin(t2(t));

dJ13dt = diff(J13,t)

%%

J23 = a4*cos(t2(t)) + a4*cos(t2(t));

dJ23dt = diff(J23,t)





%%


J31 = a2*cos(t1(t)) + a4*cos(t1)*cos(t2(t))

dJ31dt = diff(J31,t)



%%


J33 = -a4*sin(t1(t))*sin(t2(t));

dJ33dt = diff(J33,t)


%%


J43 = -sin(t1);

dJ43dt = diff(J43,t)


%%

J63 = cos(t1);

dJ63dt = diff(J63,t)

