addpath('./energy');
clear
dh;
kinematicsParams;
% initialization of params due to matlab indexing
z0 = [0 0 1]';
dofs = 3;

R_i = {};
R_i_1 = {};

w = {[0 0 0]'};
wD = {[0 0 0]'};
pDD = {[0 0 0]' - g0};
pDDC = {[0 0 0]'};
wMi = {eye(3,1)*0};

th = [0 pi/2 0 pi]; % thetas of displacement d_i
dth = [0 0 0 0]; % velocities
ddth = [0 0 0 0]; % accelerations

% zm = [zm1;zm2;zm3];

% F -> fixed
% P -> prismatic
% R -> rotational

q_s = ['F','R','P','R']; 




%% initialization cycle 
syms alfa d
for i = 1:dofs
    % rotation mtx between link i-1 and link i
    R = subs(Tmtx(i+1,dh_table_s),{t1,d1,t2},th(2:end)); % symbol defined table
    R_i{i} = R(1:3,1:3); % retrieve R from T
end
R_i{4} = eye(3);

for i = 1:dofs
   %r_i_i-1
    tmp = Tmtx(i+1,dh_table);
    r_ii{i} = R_i{i}*(tmp(1:3,4));
end
% r_ii{2} = [0 0 a3]';
% r_ii{4} = [a4 0 0];
   
%% forward recursion computation
for i = (1:dofs)+1
    % rotation mtx between link i-1 and link i
    if(q_s(i) == 'P')
        disp('prismatic');
            w{i} = R_i{i-1}'*w{i-1};
            wD{i} = R_i{i-1}'*wD{i-1};
            pDD{i} = R_i{i-1}'*(pDD{i-1}+ddth(i)*z0) + 2*dth(i)*cross(w{i},(R_i{i-1}'*z0)) + cross(wD{i},r_ii{i-1}) + cross(w{i},cross(w{i},r_ii{i}));
    else
        disp('rotational');
            w{i} = R_i{i-1}' * (w{i-1} + dth(i)*z0);
            wD{i} = R_i{i-1}' * (wD{i-1} + ddth(i)*z0 + dth(i)*cross(w{i-1},z0));
            pDD{i} = R_i{i-1}'*(pDD{i-1}+ddth(i)*z0)  + cross(wD{i},r_ii{i-1}) + cross(w{i},cross(w{i},r_ii{i-1}));
    end
    pDDC{i} = pDD{i} + cross(wD{i},r_ic{i-1}) + cross(w{i},cross(w{i},r_ic{i-1}));
    wMi{i} = wD{i-1} ;%+ kri(i)*ddth(i)*zm(i-1,:)' ;%+ kri(i)*dth(i)*cross(w{i-1},zm(i-1,:));

end



%% backward recursion to estimate tau

he = {}; %f_n+1 u_n+1
he{1} = [0 0 0]';
he{2} = [0 0 0]';

f_n = {[0 0 0]';[0 0 0]';[0 0 0]';he{1}};
u_n = {[0 0 0]';[0 0 0]';[0 0 0]';he{2}};
tau = {};

I_{1} = Im1;
I_{2} = Im2;
I_{3} = Im3;
I_m{1} = 1;
I_m{2} = 1;
I_m{3} = 1;

% backward cycle
for i = (dofs:-1:1)
    T = Tmtx(i+2,dh_table_s);
    R = subs(T,{t1,d1,t2},th(2:end)); % symbol defined table
    R_i_1{i} = R_i{i+1}; % retrieve R from T
    
    f_n{i} = R_i_1{i} * f_n{i+1} + m(i+1)*pDDC{i+1};
    u_n{i} = -cross(f_n{i},r_ii{i}+r_ic{i}) + R_i_1{i} * u_n{i+1} + R_i_1{i}*cross(f_n{i+1},r_ic{i})+...
        I_{i}*wD{i}+cross(w{i},I_{i}*w{i});
    %+kri(i)*ddth(i)*I_m{i+1}*zm(i,:)'+kri(i)*dth(i)*I_m{i+1}*zm(i,:)';
    
%   disp(f_n{i})
    if(q_s(i+1)=='P')
        tau{i} = f_n{i}'*R_i{i}'*z0;%kri(i+1)*I_m{i}*wMi{i}'*zm(i,:)'; % friction not added
    else
        tau{i} = u_n{i}'*R_i{i}'*z0;%+kri(i+1)*I_m{i}*wMi{i}'*zm(i,:)'; % friction not added
    end
end



%% display the torques tau


for i = (1:dofs)
    if(isa(tau{i},'sym'))
        tau{i} = eval(tau{i});
    end
    disp('tau '+string(i)+' :')
    disp(tau{i})
end
%%
