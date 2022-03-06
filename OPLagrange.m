function [OPL,u,u_e] = OPLagrange(q,dq,h,h_e)

%LAGRANGE_OPERATIONAL Compute the operational space dynamic model for the given dynamic matrices and kinematics
J = jacobian(q(1),q(2),q(3));
J_s = jacobianSymb();
[JA,TA] = analiticalJacobian(J,q);
B = BMtx(J);
B_s = BMtx(J_s);
C = CMtx(B_s);
G = GMtx();

BA = JA*pinv(B)*JA';
BA = pinv(BA);
CA = BA*JA*pinv(B)*C*dq' - BA*JA*dq';
GA = BA*JA*pinv(B)*G';

[a1,a2,a3,a4,a_c1,b_c1,h_c1,a_cube,b_cube,c_cube,a_c2,b_c2,h_c2,zm,g0,kri,m_c1,m_c2,m_cube,m,r_ic,r_ii,Im1,Im2,Im3] = kinematicsParams();
syms t1 t2 d1
OPL = eval(subs(BA+CA+GA,[t1,d1,t2],q));


u = TA'*h;
u_e = TA'*h_e;

