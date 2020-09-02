function mr_out = AcquireAF(mr, V, Tc, T, freq, Htilde, tau0, N)
    kB = 1.38e-23;
    mu0 = pi*4e-7; 

    Mr = zeros(length(T), 2);     
    Ms0 = CalculateMs0(Tc); 
    Ms = Ms0 .* sqrt(1 - (T./Tc)); 
    HK = N.*Ms; 
    t = 1./(2*freq); 
    Hq = sqrt(2*kB*T.*N.*log(t./tau0)./(mu0.*V));
    Hc = HK - Hq; 
    
    remanence = Hc > (Htilde/mu0); 
    mr_out = zeros(size(V,1), size(V,2), 2); 
    mr_out(:,:,1) = remanence.*mr(:,:,1);
    mr_out(:,:,2) = remanence.*mr(:,:,2);
end