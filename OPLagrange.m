function OPL = OPLagrange(q,qD)

%LAGRANGE_OPERATIONAL Compute the operational space dynamic model for the given dynamic matrices and kinematics
J = jacobian(q(1),q(2),q(3));
J_s = jacobianSymb();
JA = analiticalJacobian(J,q,qD);
B = BMtx(J);
B_s = BMtx(J_s);
C = CMtx(B_s);
G = GMtx();

BA = JA*pinv(B)*JA';
BA = pinv(BA);
CA = BA*JA*pinv(B)*C*qD' - BA*JA*qD';
GA = BA*JA*pinv(B)*G';

kinematicsParams;
syms t1 t2 d1
OPL = eval(subs(BA+CA+GA,[t1,d1,t2],q));

