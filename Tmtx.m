function T = Tmtx(link,DH)
if(link > 4 || link <= 0)
    T = eye(4);
    return
end
    theta = DH(link,4);
    alfa = DH(link,2);
    a = DH(link,1);
    d = DH(link,3);

    T = [
    cos(theta) -sin(theta)*cos(alfa) sin(theta)*sin(alfa) a*cos(theta);
    sin(theta) cos(theta)*cos(alfa) -cos(theta)*sin(alfa) a*sin(theta);
    0           sin(alfa)           cos(alfa)               d;
    0               0                   0                   1
];



end