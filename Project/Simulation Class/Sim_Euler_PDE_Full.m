classdef Sim_Euler_PDE_Full < Time_Method_Euler & PDE_Full & Sim_Base
    %SIMULATION Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
    
    
    end
    
    methods
        function S = Sim_Euler_PDE_Full(P,L0,D,R)
            %SIMULATION Construct an instance of this class
            
            S@PDE_Full(D);
            S@Time_Method_Euler();
            S@Sim_Base(L0,P,R);
            S=S.calc_file_name();
            S=S.load_file();
            %S.file_name = strcat(S.pde_name, '_',S.time_method_name,'_p=', num2str(S.P.pv), '_Nx=', num2str(S.P.Nx));
        end
        

    end
end

