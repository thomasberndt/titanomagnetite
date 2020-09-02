
[V, Tc, mr, yr] = SetupVariables();

scenario_number = 608; 
scenario_description = 'Pure magnetite. N=0.5. Primary TRM 1h+Brunhes VRM. '; 
shape = 0.5;
tau0 = 1e-10;
H0 = [30e-6; 0]; 


f = 1e8 * exp(-(log(V)-log(10e-9^3)).^2/2 ...
              -(Tc-(580+273)).^2/1e2);

f(f<1) = 0; 
f(Tc<580+273) = 0;  % same as 031

f(f<1) = 0; 
PlotGrainDistribution(   scenario_number, scenario_description, f, V, Tc); 

mr2 = AcquireTRM(mr , V, Tc, 20+273, 580+273, 3600, H0,  tau0, shape); 
mr3 = AcquireVRM(mr2, V, Tc, 20+273, 780e3*yr, H0,  tau0, shape); 

save(sprintf('..\\Temp\\Ms %03d.mat', scenario_number));

T = [20:20:400 450 500 550] + 273; 
[NRM, pTRM, m, b] = ...
        Thellier(scenario_number, scenario_description, ...
            f, mr3, V, Tc, tau0, shape, H0, 600, T); 
        
save(sprintf('..\\Temp\\Ms %03d.mat', scenario_number));
