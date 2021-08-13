function D2 = Centred_2nd_Deriv_3_Pt_Sym_Periodic(P)
% Set up the second order differentiation matrix using central
% differences, with periodic boundary conditions.
% Create finite difference differentiation matrix
D2 = full(gallery('tridiag',P.Nx,1,-2,1));
% and impose BCs (they are periodic)
D2(P.Nx,1)=1;D2(1,P.Nx)=1;
D2 = D2/P.dx^2; D2 = sparse(D2);
end
