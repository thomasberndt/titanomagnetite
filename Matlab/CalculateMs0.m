function Ms0 = CalculateMs0(Tc)
    Ms0m = 480e3;
    Ms0t = 125e3;
    Tcm = 580+273;
    a = 280; 
    b = 500; 
    
    x = - b/(2*a) + sqrt((Tcm-Tc)/a+b^2/(4*a^2)); 
    
    Ms0 = Ms0m - 1/0.6*(Ms0m - Ms0t)*x; 
end