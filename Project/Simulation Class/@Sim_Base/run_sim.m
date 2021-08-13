        function S = run_sim(S,run_time)
            S=time_method(S,round(run_time*S.P.tau/S.P.dt));
            S.t = S.t + run_time;
            size(S.L)
            size(S.L_history)
            S.L_history(end+1,:) = S.L;
            S.t_history(end+1) = S.t;
            save([S.save_location,S.file_name],'S');
        end