J = jacobianSymb();
B = BMtx(J);
C = CMtx(B);
params;


[a1,a2,a3,a4,a_c1,b_c1,h_c1,a_cube,b_cube,c_cube,a_c2,b_c2,h_c2,zm,g0,kri,m_c1,m_c2,m_cube,m,r_ic,r_ii,Im1,Im2,Im3] = kinematicsParams();
syms dt1 dd1 dt2
disp('C : ')
disp(eval(C))