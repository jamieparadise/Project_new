classdef Time_Method_RK4
    %TIME_METHOD_COMPONENT_EULER Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        time_method_name='RK4'
    end
    
    methods
        function S = Time_Method_RK4()
            %TIME_METHOD_COMPONENT_EULER Construct an instance of this class
            %S@Time_Method(L0,P,R);
        end
        
        function S = time_method(S,Nt)

%             for i = 1:Nt-1
%                 K1 = odefun((i-1)*P.dt,L,P,D1,D2);
%                 K2 = odefun((i-.5)*P.dt,L+dt*K1/2,P,D1,D2);
%                 K3 = odefun((i-.5)*P.dt,L+dt*K2/2,P,D1,D2);
%                 K4 = odefun(i*P.dt,L+dt*K3,P,D1,D2);
%                 L = L + dt*(K1/6+K2/3+K3/3+K4/6);
%             end
            P=S.P;
            for i = 1:Nt-1
                L=S.L;
                K1 = S.odefun((i-1)*P.dt);
                S.L=L+P.dt*K1/2;
                K2 = S.odefun((i-.5)*P.dt);
                S.L=L+P.dt*K2/2;
                K3 = S.odefun((i-.5)*P.dt);
                S.L=L+P.dt*K3;
                K4 = S.odefun(i*P.dt);
                S.L = L + P.dt*(K1/6+K2/3+K3/3+K4/6);
            end
        end
        
    end
end
