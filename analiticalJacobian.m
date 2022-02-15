function [JA,TA] = analiticalJacobian(J,q)
Hb_e = Rotation_btwn_links(1,4,q);
[a1,a2,a3,a4,a_c1,b_c1,h_c1,a_cube,b_cube,c_cube,a_c2,b_c2,h_c2,zm,g0,kri,m_c1,m_c2,m_cube,m,r_ic,r_ii,Im1,Im2,Im3] = kinematicsParams();
Hb_e = eval(Hb_e);
Phi = rotm2eul(Hb_e(1:3,1:3), 'ZYZ');
k   = Phi(1);
t   = Phi(2);






T = [0, -sin(k), cos(k)*sin(t);
     0,  cos(k), sin(k)*sin(t);
     1,       0,        cos(t)];

TA = [ eye(3),eye(3)*0;eye(3)*0,T];


JA = TA*J;

end