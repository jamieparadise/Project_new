classdef PS_D
    %DIF_FUNC Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        
    end
    
    methods
        function S = PS_D()

        end
                
        function w = D1_func(S,v)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            w = S.D1(v);
        end
        
        function w = D2_func(S,v)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            w = S.D2(v);
        end
    end
end

