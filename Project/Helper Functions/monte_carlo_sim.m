function S_avg = monte_carlo_sim(Sim_Class,P,L0,D,run_time,N)
R = RandStream.create('mrg32k3a');
for i=1:N
    R.Substream = i;
    S(i)= Sim_Class(P,L0,D,R);
    S(i).multi_run_until(run_time);
end
R.Substream = N+1;
S_avg= Sim_Class(P,L0,D,R);
S_avg.pde_name=[S_avg.pde_name,'_AVG'];
R.Substream = 1;
S_avg.rand_stream = R;
S_avg=S_avg.calc_file_name();
S_avg.t_history=S(N).t_history;
loops=length(S_avg.t_history)
L_history=S(1).L_history;
for j=1:loops
    for i=1:N
        L_history(j,:)=L_history(j,:) + S(i).L_history(j,:);
    end
end
S_avg.L_history = L_history/N;
S_avg.t=S_avg.t_history(end);
S_avg.L=S_avg.L_history(end,:);
S_avg.save_file();
end

