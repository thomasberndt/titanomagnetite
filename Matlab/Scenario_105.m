
[V, Tc, mr, yr] = SetupVariables();

scenario_number = 105; 
scenario_description = 'Bimodal. N=0.5. Primary TRM 1h, tumbling 16ka, VRM 1 yr. '; 
shape = 0.5;
tau0 = 1e-10;
H0 = [30e-6; 0]; 

f = 1e8 * exp(-(log(V)-log(10e-9^3)).^2/3 ...
              -(Tc-(580+273)).^2/1e3) + ...
      8e5 * exp(-(log(V)-log(30e-9^3)).^2/2 ...
              -(Tc-(200+273)).^2/1e3);

f(f<1) = 0; 
PlotGrainDistribution(   scenario_number, scenario_description, f, V, Tc); 

mr2 = AcquireTRM(mr , V, Tc, 20+273, 580+273, 3600, H0,         tau0, shape); 
mr3 = mr2; 
for n = 1:16000
    mr3 = AcquireVRM(mr3, V, Tc, 20+273, 1*yr, Rot(H0,360*rand()), tau0, shape);
end
mr4 = AcquireVRM(mr3, V, Tc, 20+273, 1*yr, Rot(H0,90), tau0, shape);
    
save(sprintf('..\\Temp\\Ms %03d.mat', scenario_number));
    

PlotSample(scenario_number, scenario_description, f, mr3, V, Tc, tau0, shape)

save(sprintf('..\\Temp\\Ms %03d.mat', scenario_number));