
function [B] = B_hat_lagrangian(q)


[a1,a2,a3,a4,a_c1,b_c1,h_c1,a_cube,b_cube,c_cube,a_c2,b_c2,h_c2,zm,g0,kri,m_c1,m_c2,m_cube,m,r_ic,r_ii,Im1,Im2,Im3] = kinematicsParams();

t1 = q(1);
d1 = q(2);
t2 = q(3);


m_c1 = m_c1*20;
m_cube = m_cube * 20;
m_c2 = m_c2 * 20;
B = [[(m_cube*(60*a2^2 + 1))/60 + (m_c1*(400*a2^2 + 57))/400 + (m_c2*(41*cos(t2)^2 - 9*sin(2*t2) + 400*a4^2*cos(t2)^2 + 400*a2^2 + 800*a2*a4*cos(t2) + 16))/400,                0, (9*2^(1/2)*m_c2*sin(t2 + pi/4))/400]
[                                                                                                                                                        0,    m_c2 + m_cube,                    -a4*m_c2*cos(t2)]
[                                                                                                                      (9*2^(1/2)*m_c2*sin(t2 + pi/4))/400, -a4*m_c2*cos(t2),          (m_c2*(400*a4^2 + 57))/400]];

end