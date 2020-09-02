function mr_out = AcquireHysteresis(mr, V, Tc, T, t, H0, tau0, shape)
    mu0 = pi*4e-7; 
    kB = 1.38e-23;
    Ms0 = CalculateMs0(Tc);
    
    ms = Ms0 .* sqrt(1 - (T./Tc)); 
    ms(T>Tc) = 0; 
    t_12 = zerus; 
    t_12(:,:,1) = tau0 .* exp(V ./ (2*kB*T) .* (mu0*shape.*ms.^2 + 2*H0(1).*ms + H0(1)^2./(mu0*shape)) );
    t_21(:,:,1) = tau0 .* exp(V ./ (2*kB*T) .* (mu0*shape.*ms.^2 - 2*H0(1).*ms + H0(1)^2./(mu0*shape)) );
    if length(H0) > 1
        t_12(:,:,2) = tau0 .* exp(V ./ (2*kB*T) .* (mu0*shape.*ms.^2 + 2*H0(2).*ms + H0(2)^2./(mu0*shape)) );
        t_21(:,:,2) = tau0 .* exp(V ./ (2*kB*T) .* (mu0*shape.*ms.^2 - 2*H0(2).*ms + H0(2)^2./(mu0*shape)) );
    end
    t_relax = 1 ./ (1./t_12 + 1./t_21); 
    mr_eq = zerus; 
    mr_eq(:,:,1) = tanh( V.*ms*H0(1) ./ (kB*T) ); 
    if length(H0) > 1
        mr_eq(:,:,2) = tanh( V.*ms*H0(2) ./ (kB*T) ); 
    end
    
    
    mr_out =    mr .* exp(-t./t_relax) + ...
                    mr_eq .* (1-exp(-t./t_relax));
                  
    
    
end