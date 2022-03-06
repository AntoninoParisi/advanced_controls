function [J,pl1,pl2,pl3,wl1,wl2,wl3] = jacobian_comp(q)
H = eye(4);
z = cast(eye(4,3),'sym');
dh;
for i = 1:4
    
    H = H * Tmtx(i,dh_table_s);
    P{i} = H(1:3,end);
    R{i} = H(1:3,1:3);
    z(i,:) = H(1:3,3)';
end
q_s = 'FRPR';


J = cast(eye(6,4)*0,'sym');
J_c = {};
for i = 2:4
    for j = 2:i
        if(q_s(j)=='P')
            J(:,j) = [z(j-1,:),0,0,0];
        else
            J(:,j) = [cross(z(j-1,:),(P{i}-P{j-1})),z(j-1,:)];
        end

    end
    J_c{i} = J;
    J = cast(eye(6,4)*0,'sym');
end


for i = 2:4
        if(q_s(i)=='P')
            J(:,i) = [z(i-1,:),0,0,0];
        else
            J(:,i) = [cross(z(i-1,:),(P{4}-P{i-1})),z(i-1,:)];
        end
end



pl1 = J_c{2}(1:3,2:end);
pl2 = J_c{3}(1:3,2:end);
pl3 = J_c{4}(1:3,2:end);

wl1 = J_c{2}(4:6,2:end);
wl2 = J_c{3}(4:6,2:end);
wl3 = J_c{4}(4:6,2:end);

J = J_c{4};


a1 = 0.15;
a2 = 0.4;
a3 = 0.3;
a4 = 0.16;


J = eval(subs(J,[t1 d1 t2],q));

end