
 
 
 
 
function [C] = C_hat_lagrangian(q, qD)

t1 = q(1);
d1 = q(2);
t2 = q(3);

dt1 = qD(1);
dd1 = qD(2);
dt2 = qD(3);

[a1,a2,a3,a4,a_c1,b_c1,h_c1,a_cube,b_cube,c_cube,a_c2,b_c2,h_c2,zm,g0,kri,m_c1,m_c2,m_cube,m,r_ic,r_ii,Im1,Im2,Im3] = kinematicsParams();

m_c1 = m_c1*20;
m_cube = m_cube * 20;
m_c2 = m_c2 * 20;
C = [[-(a4*(a4*sin(2*t2) + 2*a2*sin(t2))*(dt2 - 2)*(m_c1 + m_c2 + m_cube))/4,                             0,     -(9*2^(1/2)*m_c2*sin(t1 + pi/4)*(4*dt1 - 1))/6400]
[                                                                     0,                             0,                         (a4*m_c2*sin(t2)*(dt2 - 1))/4]
[                       -(9*2^(1/2)*m_c2*sin(t1 + pi/4)*(dt1 - 2))/1600, (a4*m_c2*sin(t2)*(dt2 - 2))/4, (m_c2*(4*dt1 - 1)*(18*cos(2*t1) - 41*sin(2*t1)))/6400]];
 


end