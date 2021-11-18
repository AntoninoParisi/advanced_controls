function [J,pl1,pl2,pl3,wl1,wl2,wl3] = jacobian(t1,d1,t2)
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

for i = 2:4
    
    if(q_s(i)=='P')
        J(:,i) = [z(i-1,:),0,0,0];
    else
        J(:,i) = [cross(z(i-1,:),(P{4}-P{i-1})),z(i-1,:)];
    end
    
    
end

J = J(:,2:end);


pl1 = [J(1:3,1)'; 0 0 0; 0 0 0;]';
pl2 = [J(1:3,1:2)' ; 0 0 0]';
pl3 = J(1:3,:);

wl1 = [J(4:6,1)'; 0 0 0; 0 0 0]';
wl2 = [J(4:6,1:2)' ; 0 0 0]';
wl3 = J(4:6,:);


end