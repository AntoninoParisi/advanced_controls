function [B t1 t2 t3] = BMtx(J)

symbols;

% partial jacobian
pl1 = [J(1:3,1)'; 0 0 0; 0 0 0;]';
pl2 = [J(1:3,1:2)' ; 0 0 0]';
pl3 = J(1:3,:);

wl1 = [J(4:6,1)'; 0 0 0; 0 0 0]';
wl2 = [J(4:6,1:2)' ; 0 0 0]';
wl3 = J(4:6,:);


kinematicsParams;

% cilinder 1 energy


E = cylinder_energy(a_c1,b_c1,h_c1,m_c1);

t1 = (0.5 * m_c1 * pl1' * pl1 + 0.5 * wl1' * E * wl1);
if(isa(t1,'sym'))
    t1 = simplify(t1);
end

% t1 = eval(t1)

% cube energy



E = cube_energy(a_cube,b_cube,c_cube,m_cube);


t2 = (0.5 * m_cube * pl2' * pl2 + 0.5 * wl2' * E * wl2);
% t2 = eval(t2)
if(isa(t2,'sym'))
    t2 = simplify(t2);
end


% cilinder 2 energy

E = cylinder_energy(a_c2,b_c2,h_c2,m_c2);

t3 = (0.5 * m_c2 * pl3' * pl3 + 0.5 * wl3' * E * wl3);

if(isa(t3,'sym'))
    t3 = simplify(t3);
end
B = t1 + t2 + t3;

end 
