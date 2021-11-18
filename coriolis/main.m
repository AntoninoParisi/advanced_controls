J = jacobianSymb();
B = BMtx(J);
C = CMtx(B);
params;
disp('C : ')
disp(eval(C))
