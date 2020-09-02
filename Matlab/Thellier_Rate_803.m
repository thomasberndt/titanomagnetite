
[V, Tc, mr, yr] = SetupVariables();

scenario_number = 803; 
scenario_description = 'Titanomagnetite. N=0.5. TRM 10 min to 1 Ma. '; 
shape = 0.5;
tau0 = 1e-10;
H0 = [30e-6; 0]; 



f = 1e8 * exp(-6*((Tc-580-273)/580).^2 ...
              -1e3*((log(V)-log(10e-9^3))/7.9 ...
              +((Tc -580-273)/580)).^2);    % same as 054


f(f<1) = 0; 

PlotGrainDistribution(   scenario_number, scenario_description, f, V, Tc); 

rates = [600 3600 24*3600 30*24*3600 yr 10*yr 100*yr 1000*yr 1e4*yr 1e5*yr 1e6*yr];
ratelabels = {'10 min', '1 h', '1 day', '1 month', '1 yr', '10 yr', '100 yr', '1 ka', '10 ka', '100 ka', '1 Ma'};

[slopes, NRM0] = ThellierHeatingRateExperiment(scenario_number, scenario_description, f, mr, V, Tc, rates, H0, tau0, shape); 
PlotHeatingRateDependence(scenario_number, scenario_description, rates, slopes, ratelabels); 


save(sprintf('..\\Temp\\Ms %03d.mat', scenario_number));
