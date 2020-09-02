
[V, Tc, mr, yr] = SetupVariables();

scenario_number = 81; 
scenario_description = 'Titanomagnetite distribution. N=0.5. Primary TRM 100ka, secondary VRM 100ka. '; 
shape = 0.5;
tau0 = 1e-10;
H0 = [30e-6; 0]; 


f = 1e8 * exp(-6*((Tc-580-273)/580).^2 ...
              -4e2*((log(V)-log(10e-9^3))/8.5 ...
              +((Tc -580-273)/580)).^2);

f(f<1) = 0; 
PlotGrainDistribution(   scenario_number, scenario_description, f, V, Tc); 

mr2 = AcquireTRM(mr , V, Tc, 20+273, 580+273, 100e3*yr, H0,         tau0, shape); 
mr3 = AcquireVRM(mr2, V, Tc, 20+273, 100e3*yr, Rot(H0,90), tau0, shape);

save(sprintf('..\\Temp\\Ms %03d.mat', scenario_number));
    

PlotSample(scenario_number, scenario_description, f, mr3, V, Tc, tau0, shape)

save(sprintf('..\\Temp\\Ms %03d.mat', scenario_number));
