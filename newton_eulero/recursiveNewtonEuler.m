function [tau] = recursiveNewtonEuler(q,dq, ddq)
    
    dh;
    [a1,a2,a3,a4,a_c1,b_c1,h_c1,a_cube,b_cube,c_cube,a_c2,b_c2,h_c2,zm,g0,kri,m_c1,m_c2,m_cube,m,r_ic,r_ii,Im1,Im2,Im3] = kinematicsParams();
    
    initialConditionsF = zeros(3,6);
    g0 = [0 9.81 0]';
    dof = 3;
    RH = [];
    PH = [];
    joints = ['R','P','R']; 

    syms t1 t2 d1
    for i = 1:3
        % rotation mtx between link i-1 and link i
        R = subs(Tmtx(i+1,dh_table_s),{t1,d1,t2},q); % symbol defined table
        RH(:,:,i) = R(1:3,1:3); % retrieve R from T
        PH(:,i) = eval(R(1:3,4));
    end
    
    RH(:,:,4) = eye(3);
    
    
    z0 = [0; 0; 1];

    % FORWARD 

    r = sym(zeros(3, dof + 1));
    r_i_CoM = sym(zeros(3, dof + 1));  
    
    Kr = [0, kri];
    zm = [zeros(3, 1), zm];
    dq = [0; dq];
    ddq = [0; ddq];
    
    ddpC = sym(zeros(3, dof + 1));
    dwm = sym(zeros(3, dof + 1));
    
    w = sym(zeros(3, dof + 1));
    dw = sym(zeros(3, dof + 1));
    ddp = sym(zeros(3, dof + 1));
    
    % frame 0 values 
    w(:, 1) = initialConditionsF(:,1);
    dw(:, 1) = initialConditionsF(:,2);
    ddp(:, 1) = initialConditionsF(:,3) - g0;

 
    for i= 2:dof+1  
        
        R_previous = RH(:,:,i-1);  % from i-1 to i
        r(:, i) = (R_previous'*PH(:, i-1));
        r_i_CoM(:, i) = r_ic{i-1};
    
        if joints(i-1) == 'R'
            w(:, i) = R_previous'*w(:, i-1) + R_previous'*dq(i)*z0;
            dw(:, i) = R_previous'*dw(:, i-1) + R_previous'*(ddq(i)*z0 + dq(i)*cross(w(:, i-1),z0));
            ddp(:, i) = R_previous'*ddp(:, i-1) + cross(dw(:, i), r(:, i)) + cross(w(:, i), cross(w(:, i), r(:, i)));
        else
            w(:, i) = R_previous'*w(:, i-1);
            dw(:, i) = R_previous'*dw(:, i-1);
            ddp(:, i) = R_previous'*ddp(:, i-1) + cross(dw(:, i), r(:, i)) + cross(w(:, i), cross(w(:, i), r(:, i))) + R_previous'*ddq(i)*z0 + 2*dq(i)*cross(w(:, i), R_previous'*z0);  
        end
            ddpC(:, i) = ddp(:, i) + cross(dw(:, i), r_i_CoM(:, i)) + cross(w(:, i), cross(w(:, i), r_i_CoM(:, i)));
            dwm(:, i) = dw(:, i-1) ;%+ Kr(i)*ddq(i)*zm(:, i) + Kr(i)*dq(i)*cross(w(:, i-1), zm(:, i));
    end
    
    % BACKWARD 

    f = zeros([3, dof + 1], 'sym');
    mu = zeros([3, dof + 1], 'sym');
    tau = zeros([dof, 1], 'sym');

    % frame n+1 values 
    f(:,dof + 1) = [ 0 0 0 ];
    mu(:,dof + 1) = [0 0 0];


    % delete first column now since it's useless and index error-proning
    w = w(:, 2:end);
    dw = dw(:, 2:end);
    ddpC = ddpC(:, 2:end);
    dwm = dwm(:, 2:end);
    r = r(:, 2:end);
    r_i_CoM = r_i_CoM(:, 2:end);
    % ... and append a mock sentinel link/motor at the end
    dq = [dq; 0];
    ddq = [ddq; 0];
    I_m = [1 1 1];
    I_m = [I_m, 0];
    Kr = [kri, 0];
    zm = [zm, zeros(3, 1)];

    
    for i= dof:-1:1
        % precomputations
        
        R_previous = RH(:,:,i);  % from i-1 to i
        R_next = RH(:,:,i+1);  % from i to i+1
        mi = 0.4;
        Iaug = rand(3);
        
        f(:, i) = R_next*f(:, i+1) + mi*ddpC(:, i);
        mu(:, i) = - cross(f(:, i), r(:, i) + r_i_CoM(:, i)) + R_next*mu(:, i+1) + cross(R_next*f(:, i+1), r_i_CoM(:, i)) + Iaug*dw(:, i) + cross(w(:, i), Iaug*w(:, i)) ... 
                    ; %Kr(i+1)*ddq(i+1)*Im(i+1)*zm(:, i+1) + Kr(i+1)*dq(i+1)*Im(i+1)*cross(w(:, i), zm(:, i+1));
        f(:, i) = simplify(f(:, i));
        mu(:, i) = simplify(mu(:, i));
           
        % get generalized torques 
        if joints(i) == 'R' 
            tau(i) = mu(:, i)'*R_previous'*z0 ;%+ Kr(i)*Im(i)*dwm(:, i)'*zm(:, i) + Fv(i, i)*dq(i) + Fs(i, i)*sign(dq(i));
        else
           tau(i) = f(:, i)'*R_previous'*z0 ;%+ Kr(i)*Im(i)*dwm(:, i)'*zm(:, i) + Fv(i, i)*dq(i) + Fs(i, i)*sign(dq(i));
        end
        tau(i) = simplify(tau(i));
    end
    
end

