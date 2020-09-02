function [slopes, NRM0] = ThellierHeatingRateExperiment(scenario_number, scenario_description, f, mr, V, Tc, rates, H0, tau0, shape); 

    slopes = NaN * zeros(size(rates)); 
    NRM0 = NaN * zeros(size(rates)); 

    for n = 1:length(rates)
        mr3 = AcquireTRMnewtonian(mr , V, Tc, 20+273, 580+273, rates(n), H0,  tau0, shape); 
        T = [100 500] + 273; 
        [NRM, pTRM, m, b] = ...
                Thellier(scenario_number, scenario_description, ...
                    f, mr3, V, Tc, tau0, shape, H0, 600, T); 
        slopes(n) = m; 
        NRM0(n) = NRM(1); 
    end

end