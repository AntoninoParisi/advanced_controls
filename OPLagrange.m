function OPL = OPLagrange(q,qD)

%LAGRANGE_OPERATIONAL Compute the operational space dynamic model for the given dynamic matrices and kinematics
J = jacobian(q(1),q(2),q(3));
J_s = jacobianSymb();
JA = analiticalJacobian(J);
B = BMtx(J);
B_s = BMtx(J_s);
C = CMtx(B_s);
G = GMtx();

BA = inv(JA*inv(B)*JA');
CA = BA*JA*inv(B)*C*qD' - BA*JA*qD';
GA = BA*JA*inv(B)*G';

OPL = BA+CA+GA;