classdef kinematics
    
    properties
      dh_s {sym}
      dh   {sym}
      mech_params
      dofs
   end
   methods
       % constructor
       function this = kinematics(dh,dh_s,dofs,mech_params)
           this.dh_s = dh_s;
           this.dh = dh;
           this.dofs = dofs;
           this.mech_params = mech_params;
       end
      function dh = get_dh(obj)
         dh = obj.dh;
      end
      function dh = get_dh_s(obj)
         dh = obj.dh_s;
      end
      
      function T = get_T_mtx(obj,link)
          if(link > 4 || link <= 0)
            T = eye(4);
            return;
          end
            theta = obj.dh(link,4);
            alfa = obj.dh(link,2);
            a = obj.dh(link,1);
            d = obj.dh(link,3);

            T = [
                cos(theta) -sin(theta)*cos(alfa) sin(theta)*sin(alfa) a*cos(theta);
                sin(theta) cos(theta)*cos(alfa) -cos(theta)*sin(alfa) a*sin(theta);
                0           sin(alfa)           cos(alfa)               d;
                0               0                   0                   1
            ];
      end
      
      function T = get_T_mtx_symb(obj,link)
          if(link > 4 || link <= 0)
            T = eye(4);
            return;
          end
            theta = obj.dh_s(link,4);
            alfa = obj.dh_s(link,2);
            a = obj.dh_s(link,1);
            d = obj.dh_s(link,3);

            T = [
                cos(theta) -sin(theta)*cos(alfa) sin(theta)*sin(alfa) a*cos(theta);
                sin(theta) cos(theta)*cos(alfa) -cos(theta)*sin(alfa) a*sin(theta);
                0           sin(alfa)           cos(alfa)               d;
                0               0                   0                   1
            ];
      end
      function r = get_rot_link(obj,i,j,q)
        if(i <= 0 || i>5)
            r = eye(4);
            return
        end
        if(i == 5)
            r = obj.get_T_mtx(4);
            return
        end
        
        R = eye(4);
        
        for index = i:j
            T = obj.get_T_mtx(index);
            R = R*T;
        end
        syms t1 t2 d1
        R = subs(R,{t1,d1,t2},q);
        r = eval(R(1:3,1:3));
          
      end
      
      function [J pl1 pl2 pl3 wl1 wl2 wl3] = jacobian(obj,q)
            H = eye(4);
            z = cast(eye(4,3),'sym');
            for i = 1:obj.dofs+1
                H = H * obj.get_T_mtx_symb(i);
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
            syms t1 t2 d1 a1 a2 a3 a4 
            J = subs(J,{t1,d1,t2},q);
            J = subs(J,{a1,a2,a3,a4},[obj.mech_params.a1,obj.mech_params.a2,obj.mech_params.a3,obj.mech_params.a4]);

          
      end
      function [J pl1 pl2 pl3 wl1 wl2 wl3] = jacobianSymb(obj)
            H = eye(4);
            z = cast(eye(4,3),'sym');
            for i = 1:obj.dofs+1
                H = H * obj.get_T_mtx_symb(i);
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
      
   end
end