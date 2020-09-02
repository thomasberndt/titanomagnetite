function mr_out = AcquireTRMnewtonian(mr, V, Tc, Tf, T0, tf, H0, tau0, shape)
    T = linspace(T0, Tf, 2000);
    DT = 5; 
    Ta = Tf - DT; 
    %t = tf * log((T0-Ta)./(T-Ta)) / log((T0-Ta)/(Tf-Ta)); 
    dt = tf ./ ((T-Ta) * log((T0-Ta)/(Tf-Ta)));
    mr_out = mr; 
    for n = 1:length(T)
        mr_out = AcquireVRM(mr_out, V, Tc, T(n), dt(n), H0, tau0, shape); 
    end
end