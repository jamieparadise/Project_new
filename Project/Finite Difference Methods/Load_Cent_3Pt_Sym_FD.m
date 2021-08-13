function D = Load_Cent_3Pt_Sym_FD(P)
    D.D1 = Centred_1st_Deriv_3_Pt_Sym_Periodic(P);
    D.D2=Centred_2nd_Deriv_3_Pt_Sym_Periodic(P);
    D.D_name='C3SFD';
end

