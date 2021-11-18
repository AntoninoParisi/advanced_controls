function JA = analiticalJacobian(J)


k = pi/2;
t = pi/4;

T = [0, -sin(k), cos(k)*sin(t);
0,  cos(k), sin(k)*sin(t);
1,       0,        cos(t)];

TA = [ eye(3),eye(3)*0;eye(3)*0,T];


JA = TA*J;

end