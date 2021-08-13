        function S = calc_file_name(S)
            dt_str = num2str_no_dp(S.P.dt,2);
            S.file_name = strcat(S.pde_name, '_',S.time_method_name,'_',S.init_name,...
            '_pv=', num2str(S.P.pv),'_Nx=', num2str(S.P.Nx),'_dt=', dt_str);
            if S.rand_stream.Seed ~= 0
                S.file_name = strcat(S.file_name,'_seed=',num2str(S.rand_stream.Seed));
            end
            
            if S.rand_stream.NumStreams > 1
                S.file_name = strcat(S.file_name,'_',num2str(S.rand_stream.SubStream),...
                    'of',num2str(S.rand_stream.NumStreams));
            end
        end