function [mtx,p0,p1,p2,p3,p4,z1,z2,z3,z4] = dh_mtx(dh)

syms a d alfa theta a2 d2 alfa2 theta2 a3 d3 alfa3 theta3 a4 d4 alfa4 theta4
mtx12 = [
    cos(theta) -sin(theta)*cos(alfa) sin(theta)*sin(alfa) a*cos(theta);
    sin(theta) cos(theta)*cos(alfa) -cos(theta)*sin(alfa) a*sin(theta);
    0           sin(alfa)           cos(alfa)               d;
    0               0                   0                   1
];

mtx23 = [
    cos(theta2) -sin(theta2)*cos(alfa2) sin(theta2)*sin(alfa2) a2*cos(theta2);
    sin(theta2) cos(theta2)*cos(alfa2) -cos(theta2)*sin(alfa2) a2*sin(theta2);
    0           sin(alfa2)           cos(alfa2)               d2;
    0               0                   0                   1
];
mtx34 = [
    cos(theta3) -sin(theta3)*cos(alfa3) sin(theta3)*sin(alfa3) a3*cos(theta3);
    sin(theta3) cos(theta3)*cos(alfa3) -cos(theta3)*sin(alfa3) a3*sin(theta3);
    0           sin(alfa3)           cos(alfa3)               d3;
    0               0                   0                   1
];

mtx45 = [
    cos(theta4) -sin(theta4)*cos(alfa4) sin(theta4)*sin(alfa4) a4*cos(theta4);
    sin(theta4) cos(theta4)*cos(alfa4) -cos(theta4)*sin(alfa4) a4*sin(theta4);
    0           sin(alfa4)           cos(alfa4)               d4;
    0               0                   0                   1
];


mtx = mtx12*mtx23*mtx34*mtx45;



if(exist('dh','var'))

    a = dh(1,1);
    d = dh(1,3);
    alfa = dh(1,2);
    theta = dh(1,4);
    a2 = dh(2,1);
    d2 = dh(2,3);
    alfa2 = dh(2,2);
    theta2 = dh(2,4);
    a3 = dh(3,1);
    d3 = dh(3,3);
    alfa3 = dh(3,2);
    theta3 = dh(3,4);
    a4 = dh(4,1);
    d4 = dh(4,3);
    alfa4 = dh(4,2);
    theta4 = dh(4,4);

    mtx = eval(mtx);
    mtx12 = eval(mtx12);
    mtx23 = eval(mtx23);
    mtx34 = eval(mtx34);
    mtx45 = eval(mtx45);
    
    
    p0 = [0 0 0]';
    p1 = mtx12;
    p1 = p1(1:end-1,end);
    p2 = mtx12*mtx23;
    p2 = p2(1:end-1,end);
    p3 = mtx12*mtx23*mtx34;
    p3 = p3(1:end-1,end);
    p4 = mtx12*mtx23*mtx34*mtx45;
    p4 = p4(1:end-1,end);
    
    z1 = [0 0 1]';
    r2 = mtx12*mtx23;
    r2 = r2(1:3,1:3);
    z2 = r2(:,end);
    r3 = mtx12*mtx23*mtx34;
    r3 = r3(1:3,1:3);
    z3 = r3(:,end);
    r4 = mtx(1:3,1:3);
    z4 = r4(:,end);
    
end


end 