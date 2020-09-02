
[V, Tc, mr, yr] = SetupVariables();

scenario_number = 103; 
scenario_description = 'Broad distribution. N=0.5. Primary TRM 1h, secondary TRM 1h. '; 
shape = 0.5;
tau0 = 1e-10;
H0 = [0; 30e-6]; 


% f = 1e8 * exp(-2*((Tc-480-273)/580).^2 ...
%               -2*((log(V)-log(10e-9^3))/3 ...
%               +((Tc -580-273)/580)).^2);
% 
% f(f<1) = 0; 
% % PlotGrainDistribution(   scenario_number, scenario_description, f, V, Tc); 
% % 
% mr2 = AcquireTRM(mr , V, Tc, 20+273, 580+273, 3600, H0,         tau0, shape); 
% mr3 = AcquireTRM(mr2, V, Tc, 20+273, 100+273, 3600, Rot(H0,-90), tau0, shape);
% 
% save(sprintf('..\\Temp\\Ms %03d.mat', scenario_number));
load(sprintf('..\\Temp\\Ms %03d.mat', scenario_number));

PlotSample(scenario_number, scenario_description, f, mr3, V, Tc, tau0, shape)

% save(sprintf('..\\Temp\\Ms %03d.mat', scenario_number));
