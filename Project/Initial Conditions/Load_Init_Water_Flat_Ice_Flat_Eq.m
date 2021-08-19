function L0 = Load_Init_Water_Flat_Ice_Flat_Eq(P)
h0=1.6246/P.k1;%1.6e-9; 
Ai= 1; 
xwi=P.xL/16;
%The water is just a flat layer 
L0.Llv_init=(P.dB+h0)*ones(P.Nx,1);
L0.Lsl_init=P.dB*ones(P.Nx,1);
L0.init_name = 'WFIFE';
end

