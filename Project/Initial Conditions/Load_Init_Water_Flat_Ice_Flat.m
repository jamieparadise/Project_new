function L0 = Load_Init_Water_Flat_Ice_Flat(P)
h0=2.5*P.dB;%1.6e-9; 
Ai= 1; 
xwi=P.xL/16;
%The water is just a flat 
L0.Llv_init=(P.dB+h0)*ones(P.Nx,1);
L0.Lsl_init=P.dB*ones(P.Nx,1);
L0.init_name = 'WFIF';
end

