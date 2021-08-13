function x_str = num2str_no_dp(x,n)
 
            num=x/(10^floor(log10(x)));
%             while (floor(num*10^n)~=num*10^n)
%                 floor(num*10^n)
%                 num*10^n
%                 n=n+1;
%             end
            
            x_exp = floor(log10(x));
            str_1 = num2str(round(num*10^(n-1)));
            str_2 = num2str(x_exp-n+1);
            x_str = [str_1,'e',str_2];
end

