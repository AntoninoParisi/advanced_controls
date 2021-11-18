symbols

x = a2*cos(t1) + a4*cos(t1)*cos(t2)
z = a1 + a2*sin(t1) + a4*cos(t2)*sin(t1)


simplify(expand(x^2+z^2))


a4^2*cos(t2)^2 + a1^2 + a2^2 + 2*a1*a2*sin(t1) + 2*a2*a4*cos(t2) + 2*a1*a4*cos(t2)*sin(t1)


%%

syms t k

Ry = [cos(t) 0 sin(t); 0 1 0; -sin(t) 0 cos(t)]
Rz = [cos(k) -sin(k) 0; sin(k) cos(k) 0; 0 0 1]




p1 = [0 0 1]

p2 =  Rz * [0 1 0]'

p3 =  (Rz*Ry) * [ 0 0 1]'