classdef PDE_Full_PS_D
    %ODE Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        pde_name = 'PDE_Full_PS'
    end
    
    methods
        function S = PDE_Full_PS_D()
            %ODE Construct an instance of this class
            %   Detailed explanation goes here

        end
        
        function f = odefun(S,t)
            P=S.P;
            Llv=S.L(1:P.Nx,1);
            Lsl=S.L(P.Nx+1:2*P.Nx,1);
            h=(Llv-Lsl); % h is also temporary
            gsr_prime =  -P.C2*P.k2*exp(-P.k2*h) ...
                +P.C1*exp(-P.k1*h).*(P.q0*sin(P.q0*h + P.alpha) + P.k1*cos(P.q0*h + P.alpha));
            gvdw_prime =  3*P.B*(h.^-4).*(1 - P.f*exp(-P.a*h)-(1-P.f)*exp(-P.b*h))...
                - P.B*(h.^-3).*( P.a*P.f*exp(-P.a*h)+P.b*(1-P.f)*exp(-P.b*h));
            g_prime = gsr_prime +gvdw_prime;
            DODLsl =  P.u*P.qz*sin(P.qz*Lsl)-P.delta_psl -g_prime-P.gamma_sl*S.D2(Lsl);
            DODLlv = g_prime-P.delta_plv - P.gamma_lv*S.D2(Llv);
     f(1:P.Nx,1) = S.D1((h.^3/(3*P.eta)).*S.D1(DODLlv))...
     - P.klv*DODLlv + P.ksl*(P.delta_rho/P.rhol)*DODLsl;
%             f(1:P.Nx,1) =(h.^2/(3*P.eta)).*(3*S.D1(DODLlv).*S.D1(h) +h.*S.D2(DODLlv))...
%                 - P.klv*DODLlv + P.ksl*(P.delta_rho/P.rhol)*DODLsl;
            f(P.Nx+1:2*P.Nx,1) = (-P.ksl)*DODLsl;
        end
        
        function w = D1(S,v)
            P=S.P;
            v_hat = fft(v);
            %the wave frequencies
            k = [0:P.Nx/2-1, 0, -P.Nx/2+1:-1]';
            w_hat = 1i*k.*v_hat;
            scale_factor=2*pi*P.k1/2500;
            w=real(ifft(w_hat))*scale_factor;
        end
        
        function w = D2(S,v)
            P=S.P;
            v_hat = fft(v);
            %the wave frequencies
            k = [0:P.Nx/2-1, 0, -P.Nx/2+1:-1]';
            w_hat = -k.^2.*v_hat;
            scale_factor=2*pi*P.k1/2500;
            w=real(ifft(w_hat))*(scale_factor^2);
        end

    end
end

