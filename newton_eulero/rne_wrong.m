% addpath('./energy');
% clear
% dh;
% [a1,a2,a3,a4,a_c1,b_c1,h_c1,a_cube,b_cube,c_cube,a_c2,b_c2,h_c2,zm,g0,kri,m_c1,m_c2,m_cube,m,r_ic,r_ii,Im1,Im2,Im3] = kinematicsParams();
% g0 = [0 -9.81 0]';
% % initialization of params due to matlab indexing
% z0 = [0 0 1]';
% dofs = 3;
% 
% R_i = {eye(3)};
% R_i_1 = {};
% 
% w = {[0 0 0]'};
% wD = {[0 0 0]'};
% pDD = {[0 0 0]' - g0};
% 
% th = [0 pi/2 0 0]; % thetas of displacement d_i
% dth = [0 0 0 0]; % velocities
% ddth = [0 0 0 0]; % accelerations
% 
% % zm = [zm1;zm2;zm3];
% 
% % F -> fixed
% % P -> prismatic
% % R -> rotational
% 
% q_s = ['F','R','P','R']; 
% 
% 
% 
% 
% %% initialization cycle 
% syms alfa d
% 
% % R(i-1,i)
% for i = (1:dofs)+1
%     % rotation mtx between link i-1 and link i
%     R = subs(Tmtx(i,dh_table_s),{t1,d1,t2},th(2:end)); % symbol defined table
%     R_i{i-1} = R(1:3,1:3); % retrieve R from T
% end
% 
% R_i{4} = eye(3);
% 
% for i = 1:dofs
%    %r_i_i-1
%     tmp = Tmtx(i+1,dh_table_s);
%     r_ii{i} = tmp(1:3,4);
%     r_ii{i} = subs(r_ii{i},{t1,d1,t2},th(2:end));
%     r_ii{i} = R_i{i}'*r_ii{i};
% 
% %     r_ic{i} = R_i{i}*r_ic{i};
% end
% % r_ii{1} = [0 0 0]';
% % r_ic{2} = [0 0 0]';
%    
% %% forward recursion computation
% 
% for i = (1:dofs)+1
%     % rotation mtx between link i-1 and link i
%     if(q_s(i) == 'P')
%         disp('prismatic');
%         w{i} = R_i{i}'*w{i-1};
%         wD{i} = R_i{i}'*wD{i-1};
%         pDD{i} = R_i{i}'*(pDD{i-1}+ddth(i)*z0) + 2*dth(i)*cross(w{i-1},(R_i{i-1}'*z0)) + cross(wD{i},r_ii{i-1}) + cross(w{i-1},cross(w{i-1},r_ii{i-1}));
%     else
%         disp('rotational');
%         w{i} = R_i{i}' * (w{i-1} + dth(i)*z0);
%         wD{i} = R_i{i}' * (wD{i-1} + ddth(i)*z0 + dth(i)*cross(w{i-1},z0));
%         pDD{i} = R_i{i}' * (pDD{i-1}+ddth(i)*z0)  + cross(wD{i-1},r_ii{i-1}) + cross(w{i-1},cross(w{i-1},r_ii{i-1}));
%     end
% 
%     pDDC{i-1} = pDD{i-1} + cross(wD{i-1},r_ic{i-1}) + cross(w{i-1},cross(w{i-1},r_ic{i-1}));
%     wMi{i-1} = wD{i-1}; %+ kri(i)*ddth(i)*zm(i-1,:)' ;%+ kri(i)*dth(i)*cross(w{i-1},zm(i-1,:));
% 
% end
% 
% 
% 
% 
% 
% %% backward recursion to estimate tau
% 
% he = {}; %f_n+1 u_n+1
% he{1} = [0 0 0]';
% he{2} = [0 0 0]';
% 
% f_n = {[0 0 0]';[0 0 0]';[0 0 0]';he{1}};
% u_n = {[0 0 0]';[0 0 0]';[0 0 0]';he{2}};
% tau = {};
% I_{1} = Im1;
% I_{2} = Im2;
% I_{3} = Im3;
% I_m{1} = 1;
% I_m{2} = 1;
% I_m{3} = 1;
% 
% 
% % backward cycle
% for i = (dofs:-1:1)
% %     T = Tmtx(i+2,dh_table_s);
% %     R = subs(T,{t1,d1,t2},th(2:end)); % symbol defined table
%     R_i_1{i} = R_i{i+1}; % retrieve R from T
%     
%     f_n{i} = R_i_1{i} * f_n{i+1} + m(i+1)*pDDC{i};
%     u_n{i} = -cross(f_n{i},r_ii{i}+r_ic{i}) + R_i_1{i} * u_n{i+1} + R_i_1{i}*cross(f_n{i+1},r_ic{i})+...
%         I_{i}*wD{i}+cross(w{i},I_{i}*w{i});
%     % kri(i)*ddth(i)*I_m{i+1}*zm(i,:)'+kri(i)*dth(i)*I_m{i+1}*zm(i,:)';
%     
% %   disp(f_n{i})
%     if(q_s(i+1)=='P')
%         tau{i} = f_n{i}'*R_i{i}'*z0; % kri(i+1)*I_m{i}*wMi{i}'*zm(i,:)'; % friction not added
%     else
%         tau{i} = u_n{i}'*R_i{i}'*z0; % kri(i+1)*I_m{i}*wMi{i}'*zm(i,:)'; % friction not added
%     end
% end
% 
% 
% 
% 
% %% display the torques tau
% 
% 
% for i = (1:dofs)
%     if(isa(tau{i},'sym'))
%         tau{i} = eval(tau{i});
%     end
%     disp('tau '+string(i)+' :')
%     disp(tau{i})
%     
% end
% 


function [tau] = rne(qD, qDD, kin)
%RNE compute Recursive Newton-Euler formulation

z0 = [0; 0; 1];

% FORWARD 
% collectors
% these are for i=0..n (so MATLAB indexing will shift everything by 1)
   w = sym(zeros(3, kin.dofs + 1));
  wD = sym(zeros(3, kin.dofs + 1));
 pDD = sym(zeros(3, kin.dofs + 1));
% ... but here i=0 (first columns) make no sense
   r = sym(zeros(3, kin.dofs + 1));
rCoM = sym(zeros(3, kin.dofs + 1));  
pDDC = sym(zeros(3, kin.dofs + 1));
 wDm = sym(zeros(3, kin.dofs + 1));
% ... and here i=0 (first columns) is needed because of MATLAB indexing...
Kr = [0, kin.P.Kr];
zm = [zeros(3, 1), kin.P.zm];
qD = [0; qD];
qDD = [0; qDD];

% frame 0 values 
% (1 because of MATLAB indexing...)
w(:, 1) = [0; 0; 0];
wD(:, 1) = [0; 0; 0];
pDD(:, 1) = [0; 0; 0] - kin.P.g0;

% iteration
for i=(1:kin.dofs)+1  % just MATLAB indexing, first columns are given
    % precomputations
    % get_index_str(.) and P.pCoM(.) have i-1 because of MATLAB indexing...
    [i_prev, i_this, ~] = get_index_str(i-1, kin.dofs);
    H_prev = kin.H(i_prev, i_this);
    R_prev = H_prev(1:3,1:3);  % from i-1 to i
       r(:, i) = simplify(R_prev' * H_prev(1:3,4));
    rCoM(:, i) = kin.P.pCoM(i-1);
    
    % get velocities and accelerations
    % qD(.), qDD(.), joint_type(.) have i-1 because of MATLAB indexing...
    if strcmp(kin.joint_type(i-1), 'P')  
          w(:, i) = R_prev' * (  w(:, i-1));
         wD(:, i) = R_prev' * ( wD(:, i-1));
        pDD(:, i) = R_prev' * (pDD(:, i-1) + qDD(i) * z0) + 2 * qD(i) * cross(w(:, i), R_prev' * z0) + cross(wD(:, i), r(:, i)) + cross(w(:, i), cross(w(:, i), r(:, i)));
    else
          w(:, i) = R_prev' * (  w(:, i-1) +  qD(i) * z0);
         wD(:, i) = R_prev' * ( wD(:, i-1) + qDD(i) * z0 + qD(i) * cross(w(:, i-1), z0));
        pDD(:, i) = R_prev' * (pDD(:, i-1)) + cross(wD(:, i), r(:, i)) + cross(w(:, i), cross(w(:, i), r(:, i)));
    end
    pDDC(:, i) = pDD(:, i) + cross(wD(:, i), rCoM(:, i)) + cross(w(:, i), cross(w(:, i), rCoM(:, i)));
     wDm(:, i) = wD(:, i-1) + Kr(i) * qDD(i) * zm(:, i) + Kr(i) * qD(i) * cross(w(:, i-1), zm(:, i));
end



% BACKWARD 
% collectors
% these are for i=1..n+1 (so MATLAB indexing will be nice)
f = sym(zeros(3, kin.dofs + 1));
mu = sym(zeros(3, kin.dofs + 1));
tau = sym(zeros(kin.dofs, 1));

% frame n+1 values 
f(:, kin.dofs + 1) = sym('f', [3, 1]);
mu(:, kin.dofs + 1) = sym('mu', [3, 1]);
assume(f, 'real');
assume(mu, 'real');

% delete first column now since it's useless and index error-proning
   w = w(:, 2:end);
  wD = wD(:, 2:end);
pDDC = pDDC(:, 2:end);
 wDm = wDm(:, 2:end);
   r = r(:, 2:end);
rCoM = rCoM(:, 2:end);
% ... and append a mock sentinel link/motor at the end
qD = [qD; 0];
qDD = [qDD; 0];
Im = [kin.P.Im, 0];
Kr = [kin.P.Kr, 0];
zm = [kin.P.zm, zeros(3, 1)];

% iteration
for i=kin.dofs:-1:1
    % precomputations
    [i_prev, i_this, i_next] = get_index_str(i, kin.dofs);
    H_prev = kin.H(i_prev, i_this);
    R_prev = H_prev(1:3,1:3);  % from i-1 to i
    H_next = kin.H(i_this, i_next);
    R_next = H_next(1:3,1:3);  % from i to i+1
    mi = kin.P.m(i);
    
    % get forces and torques
     f(:, i) = R_next * f(:, i+1) + mi * pDDC(:, i);
    mu(:, i) = -cross(f(:, i), r(:, i) + rCoM(:, i)) + R_next * mu(:, i+1) + cross(R_next * f(:, i+1), rCoM(:, i)) ...
               + kin.P.Iaug(i) * wD(:, i) + cross(w(:, i), kin.P.Iaug(i) * w(:, i)) ...
               + Kr(i+1) * qDD(i+1) * Im(i+1) * zm(:, i+1) + Kr(i+1) * qD(i+1) * Im(i+1) * cross(w(:, i), zm(:, i+1));
     f(:, i) = simplify(f(:, i));
    mu(:, i) = simplify(mu(:, i));
           
	% get generalized torques
    if strcmp(kin.joint_type(i), 'P')  
        tau(i) = Kr(i) * Im(i) * wDm(:, i)' * zm(:, i) + f(:, i)' * R_prev' * z0 + kin.P.Fv(i, i) * qD(i) + kin.P.Fs(i, i) * sign(qD(i));
    else
        tau(i) = Kr(i) * Im(i) * wDm(:, i)' * zm(:, i) + mu(:, i)' * R_prev' * z0 + kin.P.Fv(i, i) * qD(i) + kin.P.Fs(i, i) * sign(qD(i));
    end
    tau(i) = simplify(tau(i));
end

end



