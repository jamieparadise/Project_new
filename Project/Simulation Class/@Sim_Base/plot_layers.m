function plot_layers(S,opt)
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
min_height_ice = min(Lsl);
max_height_water = max(Llv);
first_lattice_line = floor(min_height_ice/P.dB);
height_plot = max_height_water - min_height_ice;
num_lines = round(height_plot/P.dB)+4;
for k=1:num_lines
    %This loop plots the red dashed lattice lines
    height_lattice_lines = (k-2+first_lattice_line)*P.k1*P.dB;
    plot(P.x*P.k1,ones(P.Nx,1)*height_lattice_lines,'Color','r','LineStyle','--','LineWidth',0.5)
    hold on
end
plot(P.x(:)*P.k1,Lsl*P.k1,'LineWidth',1.5,'Color','r');
hold on
plot(P.x(:)*P.k1,Llv*P.k1,'LineWidth',1.5,'Color','b');
xlabel('$k_{1}x$','FontSize',18,'interpreter','latex')
ylabel('$k_{1}L$','FontSize',18,'interpreter','latex')
axis([0 2500 (min_height_ice*P.k1-1) (max_height_water*P.k1+1)])
title("${t/\tau}=$" + num2str(plot_t,'%.1e'),'interpreter','latex');
end