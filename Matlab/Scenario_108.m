
[V, Tc, mr, yr] = SetupVariables();

scenario_number = 108; 
scenario_description = 'Titanomagnetite distribution. N=0.5. 3 TRMs '; 
shape = 0.5;
tau0 = 1e-10;
H0 = [30e-6; 0]; 


f = 1e8 * exp(-6*((Tc-580-273)/580).^2 ...
              -1e3*((log(V)-log(10e-9^3))/7.9 ...
              +((Tc -580-273)/580)).^2);   % same as 054

f(f<1) = 0; 
PlotGrainDistribution(   scenario_number, scenario_description, f, V, Tc); 

mr2 = AcquireTRM(mr , V, Tc, 20+273, 580+273, 10*3600, Rot(H0,5),         tau0, shape); 
mr3 = AcquireTRM(mr2, V, Tc, 20+273, 200+273, 10*3600, Rot(H0,175), tau0, shape);
mr4 = AcquireTRM(mr3, V, Tc, 20+273, 150+273, 10*3600, Rot(H0,5), tau0, shape);

save(sprintf('..\\Temp\\Ms %03d.mat', scenario_number));
    

PlotSample(scenario_number, scenario_description, f, mr4, V, Tc, tau0, shape)

save(sprintf('..\\Temp\\Ms %03d.mat', scenario_number));
