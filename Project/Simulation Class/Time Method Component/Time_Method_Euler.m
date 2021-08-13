classdef Time_Method_Euler
    %TIME_METHOD_COMPONENT_EULER Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        time_method_name='Euler'
    end
    
    methods
        function S = Time_Method_Euler()
            
            %TIME_METHOD_COMPONENT_EULER Construct an instance of this class
            %S@Time_Method(L0,P,R);
        end

        function S = time_method(S,Nt)
            %Nt=round(run_time / S.P.dt);
            for i = 1:Nt-1
                S.L = S.L + S.P.dt*S.odefun(i*S.P.dt);
            end
        end
    end
end
