function f = GrainDistribution(muV, muTc, muCor)
% GRAINDISTRUBTION
%   returns grain distribution function f(V, Tc)
%   - muV correlation with grain volume
%   - muTc correlation with Tc
%   - muCor correlation between Tc and V

    f = 1e8 * exp(-((log(V)-log(20e-9^3)).^2/muV + ...
                   (Tc-(530+273)).^2/muTc + ...
                   ((log(V)-log(15e-9^3))./0.3 + (Tc-(530+273))./30).^2/muCor));
    
    f(f<1) = 0; 
end