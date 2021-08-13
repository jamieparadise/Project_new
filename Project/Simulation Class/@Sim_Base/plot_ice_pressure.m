function  plot_ice_pressure(S,opt)
%plot some of the components of the DODLsl
plot_t=opt;
P=S.P;
if exist('plot_t','var') && plot_t<S.t
    t_index = find(S.t_history>=plot_t,1,'first');
    Llv = S.L_history(t_index,1:P.Nx);
    Lsl = S.L_history(t_index,P.Nx+1:end);
else
    plot_t= S.t;
    Llv =S.L(1:P.Nx);
    Lsl = S.L(P.Nx+1:end);
end
plot(P.x*P.k1,ones(P.Nx)*(P.u*P.qz),'Color','red','LineStyle','--')
hold on
plot(P.x*P.k1,ones(P.Nx)*(-P.u*P.qz),'Color','blue','LineStyle','--')
hold on
h = Llv-Lsl;
plot(P.x*P.k1,( P.delta_psl  + EQ_g_prime(h,P)),'Color','r','LineStyle','-')
%hold on
%plot(P.x*P.k1,ones(P.Nx)*(P.delta_psl),'Color','black','LineStyle','--')
hold on
plot(P.x*P.k1,P.delta_psl  +EQ_g_prime(h,P) + P.gamma_sl*S.D2_func(Lsl),'Color','black')
end
            