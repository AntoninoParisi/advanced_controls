dh 
kinematicsParams
K = computeKinematics(dh_table_s);
K = eval(subs(K,[t1,d1,t2],[pi/6 0.1 pi/3]))
pose = K(1:3,4);
or = rotm2eul(K(1:3,1:3), 'ZYZ')';


x = [pose' , or']'



