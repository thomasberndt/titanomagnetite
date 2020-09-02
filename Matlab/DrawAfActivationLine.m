function [v, Tc, h] = DrawAfActivationLine(Htilde, T, freq, tau0, N, style, linewidth)
    if nargin < 7
        linewidth = 1; 
    end
    
    mu0 = pi*4e-7;
    kB = 1.38e-23;
    Htilde = Htilde/mu0;
    
    t = 1./(2*freq);
    Tc = linspace(273, 580+273, 1000); 
    Ms0 = CalculateMs0(Tc);
    Ms = Ms0 .* sqrt(1-T./Tc); 
    HK = N.*Ms; 
    V = 2*kB*log(t./tau0).*T.*N./(mu0*(N.*Ms-Htilde).^2); 
    V(V<10e-9^3) = NaN; 
    V(V>100e-9^3) = NaN; 
    V(Htilde > HK) = NaN;
    v = V.^(1/3)/1e-9;
    
    if nargin < 6
        h = semilogx(v, Tc-273);
    else
        h = semilogx(v, Tc-273, style, 'LineWidth', 1);
    end
    h.LineWidth = linewidth;
end