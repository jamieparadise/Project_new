classdef Sim_RK4_PDE_Full_PS_D < Time_Method_RK4 & PDE_Full_PS_D & Sim_Base
    %SIMULATION Summary of this class goes here
    %   Detailed explanation goes here
    
    properties

    end
    
    methods
        function S = Sim_RK4_PDE_Full_PS_D(P,L0,D,R)
            %SIMULATION Construct an instance of this class
            

            S@Time_Method_RK4();
            S@PDE_Full_PS_D();
            S@Sim_Base(L0,P,R);
            S=S.calc_file_name();
            S=S.load_file();
        end
        

    end
end

