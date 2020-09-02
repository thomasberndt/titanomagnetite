function mr_out = AcquireRealisticTRM(mr, V, Tc, T, t, ...
                    H0_heat, H0_hold, H0_cool, tau0, shape)
    mr_out = mr; 
    mr_out = AcquireTRM(mr_out, V, Tc, T, 20+273, t, H0_heat, tau0, shape); 
    mr_out = AcquireVRM(mr_out, V, Tc, T, t, H0_hold, tau0, shape); 
    mr_out = AcquireTRM(mr_out, V, Tc, 20+273, T, t, H0_cool, tau0, shape); 
end