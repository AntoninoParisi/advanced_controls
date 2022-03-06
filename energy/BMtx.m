function [B t1 t2 t3] = BMtx()

symbols;

[J,pl1,pl2,pl3,wl1,wl2,wl3] = jacobianSymb();
[a1,a2,a3,a4,a_c1,b_c1,h_c1,a_cube,b_cube,c_cube,a_c2,b_c2,h_c2,zm,g0,kri,m_c1,m_c2,m_cube,m,r_ic,r_ii,Im1,Im2,Im3] = kinematicsParams();

% cilinder 1 energy


E = cylinder_energy(a_c1,b_c1,h_c1,m_c1);

R_01 = rot_mtx(1,2);

t1 = ( m_c1 * pl1' * pl1 +  wl1'* R_01 * E * R_01' * wl1);
if(isa(t1,'sym'))
    t1 = simplify(t1);
end

% t1 = eval(t1)

% cube energy



E = cube_energy(a_cube,b_cube,c_cube,m_cube);


R_02 = rot_mtx(1,3);

t2 = ( m_cube * pl2' * pl2 +  wl2'* R_02 * E * R_02' * wl2);

% t2 = eval(t2)
if(isa(t2,'sym'))
    t2 = simplify(t2);
end


% cilinder 2 energy

R_03 = rot_mtx(1,4);

E = cylinder_energy(a_c2,b_c2,h_c2,m_c2);


t3 = ( m_c2 * pl3' * pl3 +  wl3'* R_03 * E * R_03' * wl3);


if(isa(t3,'sym'))
    t3 = simplify(t3);
end
B = t1 + t2 + t3;

end 
