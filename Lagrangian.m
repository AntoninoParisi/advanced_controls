B = BMtx();
C = CMtx(B);
G = GMtx();
params;

disp('B + C + G : ')
[a1,a2,a3,a4] = kinematicsParams();


disp(simplify(B + C + G'))


