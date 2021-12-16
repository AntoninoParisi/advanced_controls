function JA = analiticalJacobian(J,q)
Hb_e = Rotation_btwn_links(1,4,q);
Phi = rotm2eul(Hb_e(1:3,1:3), 'ZYZ');
k   = Phi(1);
t   = Phi(2);






T = [0, -sin(k), cos(k)*sin(t);
     0,  cos(k), sin(k)*sin(t);
     1,       0,        cos(t)];

TA = [ eye(3),eye(3)*0;eye(3)*0,T];


JA = TA*J;

end