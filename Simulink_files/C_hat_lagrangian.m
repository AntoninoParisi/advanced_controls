
 
 
 
 
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
C = [[      -(dt1*dt2*m_c2*(400*sin(2*t2)*a4^2 + 800*a2*sin(t2)*a4 + 18*cos(2*t2) + 41*sin(2*t2)))/800, 0, (dt2^2*((9*2^(1/2)*m_c2*cos(t2 + pi/4))/200 - (dd1*dt1*dt2^2*m_c2*(400*sin(2*t2)*a4^2 + 800*a2*sin(t2)*a4 + 18*cos(2*t2) + 41*sin(2*t2)))/1600))/2]
[                                                                                               0, 0,                                                                                                                              a4*dt2^2*m_c2*sin(t2)]
[(dd1*dt1^4*dt2*m_c2*(400*sin(2*t2)*a4^2 + 800*a2*sin(t2)*a4 + 18*cos(2*t2) + 41*sin(2*t2)))/3200, 0,                                                                                                                                                  0]];


end