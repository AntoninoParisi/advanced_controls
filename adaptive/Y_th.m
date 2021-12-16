function [Bk,Pk] = Y_th(sigma,q,qd,qdr,qddr, prev_B, prev_Pk)

% 
lambda = 1;
X = [q,qd,qdr,qddr];

K = [prev_Pk*X'];
Bk = prev_B;
e = [sigma - X*Bk'];    

Pk = 1/lambda*(prev_Pk - (prev_Pk*X'*X*prev_Pk)/(lambda + X*prev_Pk*X'));

K = Pk*X';
e = sigma - X*Bk';
Bk = Bk' + (K*e);
    
end
