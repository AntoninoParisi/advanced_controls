% rotation matrix from link i to link j
function [R]= rot_mtx(i,j)

if(i <= 0 || i>5)
    R = eye(4);
    return
end
if(i == 5)
    R = Tmtx(4,dh_table_s);
    return
end


dh;
T = eye(3);

R = eye(4);

N = [];
S = [];
A = [];
P = [];


for index = i:j
    T = Tmtx(index,dh_table_s);
    R = R*T;
end
R = R(1:3,1:3);


