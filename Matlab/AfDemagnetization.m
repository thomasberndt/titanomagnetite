function [Mr, Htilde] = AfDemagnetization(f, mr, V, Tc, T, freq, Htilde, tau0, shape)
    kB = 1.38e-23;
    mu0 = pi*4e-7; 

    Mr = zeros(length(T), 2);     
    Ms0 = CalculateMs0(Tc);
    Ms = Ms0 .* sqrt(1 - (T./Tc)); 
    HK = shape.*Ms; 
    t = 1./(2*freq); 
    Hq = sqrt(2*kB*T.*shape.*log(t./tau0)./(mu0.*V));
    Hc = HK - Hq; 
    
    for n = 1:length(Htilde)
        remanence = Hc > (Htilde(n)/mu0); 
        Mr(n,1) = sum(sum(remanence.*Ms0.*mr(:,:,1).*f.*V)); 
        Mr(n,2) = sum(sum(remanence.*Ms0.*mr(:,:,2).*f.*V)); 
    end
end