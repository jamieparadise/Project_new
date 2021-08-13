classdef Sim_Base
    %TIME_METHOD_COMPONENT_EULER Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        t=0
        x
        P
        L
        L_history
        t_history
        rand_stream
        init_name
        file_name
        save_location = 'Simulations\'
    end
    
    methods
        function S = Sim_Base(L0,P,R)
            
            %TIME_METHOD_COMPONENT_EULER Construct an instance of this class

                                  %Load the initial surface height of ice and water layers at the start time
            %Lsl and Llv are just the temporary surface heights at each time step
            S.L = [L0.Llv_init;L0.Lsl_init];
            S.init_name = L0.init_name;
            S.L_history(1,:)=S.L; 
            S.t_history(1)=0;
            S.P=P;
            x=P.x;
            S.rand_stream=R;
        end
        
        S = calc_file_name(S)
        S=load_file(S)
        save_file(S)
        S = run_sim(S,run_time)
        S = multi_run_until(S,end_time)
        plot_layers(S,opt)
        plot_ice_pressure(S,opt)
        create_movie(S)
        
    end
end

