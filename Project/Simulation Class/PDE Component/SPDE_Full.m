classdef SPDE_Full < D_Matrix 
    %ODE Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        pde_name ='SPDE_Full'
    end
    
    methods
        function S = SPDE_Full(D,P)
            %ODE Construct an instance of this class
            %   Detailed explanation goes here
            S@D_Matrix(D);
        end
        
        
        function f = odefun(S,t)
            %formula from sup notes
            P=S.P;
            Llv=S.L(1:P.Nx,1);
            Lsl=S.L(P.Nx+1:2*P.Nx,1);
            
            Noise_Str = 1e13;
            dW = Noise_Str *randn(S.rand_stream,P.Nx,1)*sqrt(P.dt/P.Nx);
    
            h=(Llv-Lsl); % h is also temporary
            gsr_prime =  -P.C2*P.k2*exp(-P.k2*h) ...
                +P.C1*exp(-P.k1*h).*(P.q0*sin(P.q0*h + P.alpha) + P.k1*cos(P.q0*h + P.alpha));
            gvdw_prime =  3*P.B*(h.^-4).*(1 - P.f*exp(-P.a*h)-(1-P.f)*exp(-P.b*h))...
                - P.B*(h.^-3).*( P.a*P.f*exp(-P.a*h)+P.b*(1-P.f)*exp(-P.b*h));
            g_prime = gsr_prime +gvdw_prime;
            DODLsl =  P.u*P.qz*sin(P.qz*Lsl)-P.delta_psl -g_prime-P.gamma_sl*S.D2*Lsl;
            DODLlv = g_prime-P.delta_plv - P.gamma_lv*S.D2*Llv;
            f(1:P.Nx,1) = (S.D1*((h.^3/(3*P.eta)).*(S.D1*DODLlv)+ sqrt(h.^3/3).*dW(:)))- P.klv*DODLlv + P.ksl*(P.delta_rho/P.rhol)*DODLsl;
            f(P.Nx+1:2*P.Nx,1) = (-P.ksl)*DODLsl;
        end
    end
end

