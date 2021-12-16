function [a3 a2 a1 a0] = cubicTrajectory(qi,qf,dqi,dqf,ti,tf)


deltaT = tf-ti;
deltaQ = qf-qi;
a0 = qi;
a1 = dqi;
a2 = (3*deltaQ-(2*dqi+dqf)*deltaT)/deltaT^2;
a3 = (-2*deltaQ+(dqi+dqf)*deltaT)/deltaT^3;






end