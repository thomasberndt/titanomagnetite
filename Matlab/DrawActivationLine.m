function [v, Tc, h] = DrawActivationLine(T, t, tau0, shape, style, linewidth)
    if nargin < 6
        linewidth = 2.5; 
    end
    
    mu0 = pi*4e-7;
    kB = 1.38e-23;
    
    Tc = linspace(273, 580+273, 1000); 
    Ms0 = CalculateMs0(Tc);
    V = 2*kB*log(t./tau0).*T./(mu0*shape.*Ms0.^2.*(1-T./Tc));
    V(V<10e-9^3) = NaN; 
    V(V>100e-9^3) = NaN; 
    v = V.^(1/3)/1e-9;
    
    if nargin < 5
        h = semilogx(v, Tc-273);
    else
        h = semilogx(v, Tc-273, style);
    end
    h.LineWidth = linewidth;
end