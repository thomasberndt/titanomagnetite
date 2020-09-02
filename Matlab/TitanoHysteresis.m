function TitanoHysteresis(mr, scenario_number, scenario_description, f, V, Tc, shape, tau0)
    mu0 = pi*4e-7; 
    kB = 1.38e-23;
    Ms0 = CalculateMs0(Tc);
    T = 20 + 273; 
    ms = Ms0 .* sqrt(1 - (T./Tc)); 
    ms(T>Tc) = 0; 
    
    total_time = 100; 
    [H1, M1] = HysteresisLoop(f, V, Tc, T, total_time, tau0, shape);
    total_time = 1000;
    [H2, M2] = HysteresisLoop(f, V, Tc, T, total_time, tau0, shape);
    figure(2)
    plot(H1*1000, M1, H2*1000, M2); 
    figure(3)
    plot(H1(2:end), diff(M1)-diff(M2));
end