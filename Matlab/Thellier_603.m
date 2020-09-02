
[V, Tc, mr, yr] = SetupVariables();

scenario_number = 603; 
scenario_description = 'Broad distribution. N=0.5. Primary TRM 100ka, VRM 100ka. '; 
shape = 0.5;
tau0 = 1e-10;
H0 = [30e-6; 0]; 


f = 1e8 * exp(-2*((Tc-480-273)/580).^2 ...
              -2*((log(V)-log(10e-9^3))/3 ...
              +((Tc -580-273)/580)).^2);

f(f<1) = 0; 
PlotGrainDistribution(   scenario_number, scenario_description, f, V, Tc); 

mr2 = AcquireTRM(mr , V, Tc, 20+273, 580+273, 100e3*yr, H0,         tau0, shape); 
mr3 = AcquireVRM(mr2, V, Tc, 20+273, 100e3*yr, H0,         tau0, shape); 

save(sprintf('..\\Temp\\Ms %03d.mat', scenario_number));

Thellier_T = [20:20:400] + 273; 
[NRM, pTRM, m, b] = ...
        Thellier(scenario_number, scenario_description, ...
            f, mr3, V, Tc, tau0, shape, H0, 600, Thellier_T); 
        
save(sprintf('..\\Temp\\Ms %03d.mat', scenario_number));
