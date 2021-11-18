function G = GMtx()

[J,pl1,pl2,pl3,wl1,wl2,wl3] = jacobianSymb();
kinematicsParams;

G=0;


Jpli = {pl1,pl2,pl3};

for i = 1:3
    
        G = G + m(i)*g0'*Jpli{i};
    
end
% disp('G matrix : ')
% disp(G)

end