function [M, forc, Hu, Hc] = FORC(f, V, Tc, T, t_a, t_b, tau0, shape)
    
    Hsat = 1;
    Hmax = 0.3; 
    Hmin = -0.3; 
    ha = linspace(Hmin, Hmax, 1000); 
    hb = linspace(Hmin, Hmax, 1000); 
    [Ha, Hb] = meshgrid(ha, hb); 
    
    mr = zeros(size(f), 'gpuArray');
    M = NaN * zeros(size(Ha));
    
    Ms0 = CalculateMs0(Tc);
    
    a = 1 - (T./Tc); 
    a = a .* (1-(a<0)); 
    ms = Ms0 .* sqrt(a);
    HK = ms./shape; 
    mu0 = pi*4e-7; 
    kB = 1.38e-23;
    
    J = 1./(2.*V) .* sqrt(2.*HK.*kB.*T ./ (mu0.*V.*ms)) .* (sqrt(log(t_b./tau0)) - sqrt(log(t_a./tau0))); 
    forc = f.*J; 
    
    Hu = (Ha + Hb) / 2;  
    Hc = (Hb - Ha) / 2; 
    
end