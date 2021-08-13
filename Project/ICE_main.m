function ICE_main
%add all subfolders to search path
addpath(genpath(pwd));
%remove the 'Not Used' folder
rmpath('Not Used');

% Nx is the number of spacial steps, xL the size of the domain
Nx = 700;
% P is the structure array containing physical parameters
% Load_Parameters takes pressure in Pa and temperature in K as arguments
P = Load_Parameters(455, 269.5, Nx);

% Load finite difference differentiation matrices (using central difference method), with periodic boundary conditions.
D=Load_Cent_3Pt_Sym_FD(P);
dt=20e-12;  P.dt =dt;                % timestep
%Load the initial surface height of ice and water layers at the start time
%L(1,Nx)= Llv and L(Nx+1,2*Nx)=Lsl which are just the temporary surface heights at each time step
%L0 = Load_Init_Water_Drop_Ice_Flat(P);
L0 = Load_Init_Water_Flat_Ice_Square(P);
%L0=Load_Init_Water_Flat_Ice_Flat(P);

R = RandStream.create('mrg32k3a');
%S=Sim_Euler_PDE_Full_PS_D(P,L0,D,R);
%S=Sim_Euler_PDE_Full(P,L0,D,R);
S=Sim_RK4_PDE_Full_PS_D(P,L0,D,R);
%S=Sim_Euler_SPDE_Full_Rsl_PS_D(P,L0,D,R);
%Snew=Sim_Euler_SPDE_Full(P,L0,D,R);
%this runs up a time (in terms of t/tau, like in the paper)

%plot_g(S.P);
%load S.mat

%S=S.multi_run_until(10000000);
%save S.mat 'S'
%S.plot_layers(100000000);
S.plot_ice_pressure(1e8);
%S.create_movie();
%save2pdf("Ice_PDE_(Nt="+Nt+")(dt="+dt+")",gcf,300);

end