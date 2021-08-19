function S = calc_file_name(S)
dt_str = num2str_no_dp(S.P.dt,2);

if floor(S.P.pv)==S.P.pv
    pv_str=num2str(S.P.pv);
else
    pv_str=num2str_no_dp(S.P.pv,4);
end
S.file_name = strcat(S.pde_name, '_',S.time_method_name,'_',S.init_name,...
    '_pv=', pv_str,'_Nx=', num2str(S.P.Nx),'_dt=', dt_str);

if isprop(S,'Noise_Str')
    S.file_name = strcat(S.file_name,'_N_Str=', num2str_no_dp(S.Noise_Str,2));
end

if S.rand_stream.Seed ~= 0
    S.file_name = strcat(S.file_name,'_seed=',num2str(S.rand_stream.Seed));
end

if S.rand_stream.Substream > 1
    S.file_name = strcat(S.file_name,'_',num2str(S.rand_stream.Substream));
end

end