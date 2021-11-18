function [T N S A P]= computeKinematics(DH)


[r,~] = size(DH);
T = eye(4);

if(class(DH) == 'sym')
    N = cast([],'sym');
    S = cast([],'sym');
    A = cast([],'sym');
    P = cast([],'sym');
else
    N = [];
    S = [];
    A = [];
    P = [];
end

for index = 1:r
    theta = DH(index,4);
    alfa = DH(index,2);
    a = DH(index,1);
    d = DH(index,3);
    
    N(index,:) = T(:,1);
    S(index,:) = T(:,2);
    A(index,:) = T(:,3);
    P(index,:) = T(:,4);
    
    mtx = [
    cos(theta) -sin(theta)*cos(alfa) sin(theta)*sin(alfa) a*cos(theta);
    sin(theta) cos(theta)*cos(alfa) -cos(theta)*sin(alfa) a*sin(theta);
    0           sin(alfa)           cos(alfa)               d;
    0               0                   0                   1
];
    T = T*mtx;
    
    
    
end


