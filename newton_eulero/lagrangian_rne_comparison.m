q = [pi/3 0 pi/6];

dq = [0 0 3];
ddq = [0 0 0];
[a1,a2,a3,a4,a_c1,b_c1,h_c1,a_cube,b_cube,c_cube,a_c2,b_c2,h_c2,zm,g0,kri,m_c1,m_c2,m_cube,m,r_ic,r_ii,Im1,Im2,Im3] = kinematicsParams();

syms t1 d1 t2 dt1 dd1 dt2 real

%%
J = jacobianSymb();
J = simplify(J);
B = BMtx(J);
B = simplify(B);


C = CMtx(B);
C = simplify(C);

C_n = subs(C, [dt1,dd1,dt2],dq);
C_n =  subs(C_n, [t1,d1,t2],q);
C_n*dq'

%%

a = recursiveNewtonEuler(q,dq',ddq')
b = recursiveNewtonEuler(q,ddq',ddq')
c = eval(a) - eval(b)

%% gravity term

G = GMtx();
G =  subs(G, [t1,d1,t2],q);
eval(G')


G_n = recursiveNewtonEuler(q,zeros(3,1),zeros(3,1));

eval(G_n)







