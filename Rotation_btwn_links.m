% computed version of the rot_mtx, subs the q params to rotation matrix
function [R]= Rotation_btwn_links(i,j,q)

if(i <= 0 || i>5)
    R = eye(4);
    return
end
if(i == 5)
    R = Tmtx(4,dh_table_s);
    return
end


dh;
T = {};

R = eye(4);

N = [];
S = [];
A = [];
P = [];


for index = i:j
    T{index} = Tmtx(index,dh_table_s);
    R = R*T{index};
end

R = subs(R,{t1,d1,t2},q);
R = eval(R);


