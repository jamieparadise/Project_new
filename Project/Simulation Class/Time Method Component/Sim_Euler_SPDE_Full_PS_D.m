classdef Sim_Euler_SPDE_Full_PS_D < Time_Method_Euler & SPDE_Full_PS_D & Sim_Base
    %SIMULATION Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        
    end
    
    methods
        function S = Sim_Euler_SPDE_Full_PS_D(P,L0,D,R)
            %SIMULATION Construct an instance of this class
            

            S@Time_Method_Euler();
            S@SPDE_Full_PS_D();
            S@Sim_Base(L0,P,R);
            S=S.calc_file_name();
            S=S.load_file();
        end
        

    end
end

