dh 
[a1,a2,a3,a4,a_c1,b_c1,h_c1,a_cube,b_cube,c_cube,a_c2,b_c2,h_c2,zm,g0,kri,m_c1,m_c2,m_cube,m,r_ic,r_ii,Im1,Im2,Im3] = kinematicsParams();
K = computeKinematics(dh_table_s);
K = eval(subs(K,[t1,d1,t2],[0 0 -pi/3])); % pi/6 0.1 pi/3
pose = K(1:3,4);
or = rotm2eul(K(1:3,1:3), 'ZYZ')';


x = [pose' , or']'



