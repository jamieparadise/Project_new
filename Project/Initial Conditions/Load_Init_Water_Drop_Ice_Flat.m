function L0 = Load_Init_Water_Drop_Ice_Flat(P)
h0=1.6e-9; Af= 17/P.k1; xwf = 450/P.k1;
%Nx=length(x); xL=x(end);
% Set the initial condition as a (symmetric) Gaussian function
L0.Llv_init= P.dB + h0 + Af*ones(P.Nx,1).*(exp(-((P.x-P.xL/2)/xwf).^2))';
%The ice is just a flat sheet
L0.Lsl_init=P.dB*ones(P.Nx,1);
L0.init_name = 'WDIF';
end

