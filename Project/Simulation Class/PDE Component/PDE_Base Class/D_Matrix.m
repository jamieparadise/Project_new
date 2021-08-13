classdef D_Matrix
    %DIFF_MATRIX Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        D1
        D2
        D_name
    end
    
    methods
        function S = D_Matrix(D)
            %DIFF_MATRIX Construct an instance of this class
            %   Detailed explanation goes here
            S.D1 = D.D1;
            S.D2 = D.D2;
            S.D_name=D.D_name;
            S.pde_name = strcat(S.pde_name,'_',S.D_name);
        end
        
        function w = D1_func(S,v)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            w = S.D1*v;
        end
        
        function w = D2_func(S,v)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            w = S.D2*v;
        end
    end
end

