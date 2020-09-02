function mr_out = AcquireTRM(mr, V, Tc, minT, maxT, t, H0, tau0, shape)
    TT = linspace(maxT, minT, 2000);
    mr_out = mr;
    for n = 1:length(TT)
        mr_out = AcquireVRM(mr_out, V, Tc, TT(n), t./length(TT), H0, tau0, shape); 
    end
end