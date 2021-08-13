function S = multi_run_until(S,end_time)
if S.t >=end_time
    return
end

if S.t < 10000
    run_time = 100;
    num_of_sim_runs = ceil((min(end_time,10000)-S.t)/run_time);
elseif S.t < 100000
    run_time = 1000;
    num_of_sim_runs = ceil((min(end_time,100000)-S.t)/run_time);
elseif S.t < 1000000
    run_time = 10000;
    num_of_sim_runs = ceil((min(end_time,1000000)-S.t)/run_time);
else
    run_time = 100000;
    num_of_sim_runs = ceil((end_time-S.t)/run_time);
end
for i=1:num_of_sim_runs
    S=S.run_sim(run_time);
end
S=S.multi_run_until(end_time);
end