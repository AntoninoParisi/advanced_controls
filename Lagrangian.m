J = jacobianSymb();
B = BMtx(J);
C = CMtx(B);
G = GMtx();
params;

disp('B + C + G : ')

disp(eval(B + C + G'))