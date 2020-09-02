
[V, Tc, mr, yr] = SetupVariables();

scenario_number = 98; 
scenario_description = 'Titanomagnetite distribution. N=0.5. Primary TRM 1 h, secondary TRM 1 h. '; 
shape = 0.5;
tau0 = 1e-10;
H0 = [0; 30e-6]; 

% 
% f = 1e8 * exp(-6*((Tc-580-273)/580).^2 ...
%               -1e3*((log(V)-log(10e-9^3))/7.9 ...
%               +((Tc -580-273)/580)).^2);    % same as 054
% 
% f(f<1) = 0; 
% PlotGrainDistribution(   scenario_number, scenario_description, f, V, Tc); 
% 
% mr2 = AcquireTRM(mr , V, Tc, 20+273, 580+273, 3600, H0,         tau0, shape); 
% mr3 = AcquireTRM(mr2, V, Tc, 20+273, 100+273, 3600, Rot(H0,-90), tau0, shape);

load(sprintf('..\\Temp\\Ms %03d.mat', scenario_number));


PlotSample(scenario_number, scenario_description, f, mr3, V, Tc, tau0, shape)

% save(sprintf('..\\Temp\\Ms %03d.mat', scenario_number));
