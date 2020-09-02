function mr_out = AcquireVRM(mr, V, Tc, T, t, H0, tau0, shape)
    mu0 = pi*4e-7; 
    kB = 1.38e-23;
    Ms0 = CalculateMs0(Tc);
    
    a = 1 - (T./Tc); 
    a = a .* (1-(a<0)); 
    ms = Ms0 .* sqrt(a); 
    if length(H0) == 1
        t_12 = tau0 .* exp(V ./ (2*kB*T) .* (mu0*shape.*ms.^2 + 2*abs(H0(1)).*ms + H0(1)^2./(mu0*shape)) );
        t_21 = tau0 .* exp(V ./ (2*kB*T) .* (mu0*shape.*ms.^2 - 2*abs(H0(1)).*ms + H0(1)^2./(mu0*shape)) );
        highfield = abs(H0/mu0) >= shape.*ms; 
        t_21(highfield) = 0; 
    else
        t_12 = cat(3, ...
            tau0 .* exp(V ./ (2*kB*T) .* (mu0*shape.*ms.^2 + 2*H0(1).*ms + H0(1)^2./(mu0*shape))), ...
            tau0 .* exp(V ./ (2*kB*T) .* (mu0*shape.*ms.^2 + 2*H0(2).*ms + H0(2)^2./(mu0*shape)) ));
        t_21 = cat(3, ...
            tau0 .* exp(V ./ (2*kB*T) .* (mu0*shape.*ms.^2 - 2*H0(1).*ms + H0(1)^2./(mu0*shape)) ), ...
        	tau0 .* exp(V ./ (2*kB*T) .* (mu0*shape.*ms.^2 - 2*H0(2).*ms + H0(2)^2./(mu0*shape)) ));
    end
    t_relax = 1 ./ (1./t_12 + 1./t_21); 
    if length(H0) == 1
        mr_eq = tanh( V.*ms*H0(1) ./ (kB*T) ); 
    else
    	mr_eq = cat(3, ...
            tanh( V.*ms*H0(1) ./ (kB*T) ), ...
            tanh( V.*ms*H0(2) ./ (kB*T) ));
    end
    
    mr_out = mr .* exp(-t./t_relax) + ...
                    mr_eq .* (1-exp(-t./t_relax));
    
end