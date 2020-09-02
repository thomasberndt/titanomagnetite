
[V, Tc, mr, yr] = SetupVariables();

scenario_number = 48; 
scenario_description = 'Bimodal. N=0.5. Primary TRM 100ka, secondary VRM 100ka. '; 
shape = 0.5;
tau0 = 1e-10;
H0 = 30e-6; 

f = 1e8 * exp(-(log(V)-log(10e-9^3)).^2/3 ...
              -(Tc-(580+273)).^2/1e3) + ...
      4e8 * exp(-(log(V)-log(5e-9^3)).^2/0.2 ...
              -(Tc-(580+273)).^2/1e3);

f(f<1) = 0; 
PlotGrainDistribution(   scenario_number, scenario_description, f, V, Tc, shape, tau0); 
%TitanoExperiment(mr, scenario_number, scenario_description, f, V, Tc, shape, tau0); 
%TitanoHysteresis(mr, scenario_number, scenario_description, f, V, Tc, shape, tau0); 
figure
[M1, forc1, Hu1, Hc1] = FORC(f, V, Tc, 20+273, 1, 1, tau0, shape);
[M2, forc2, Hu2, Hc2] = FORC(f, V, Tc, 20+273, 100, 1, tau0, shape);
contourf(Hc1, Hu1, forc2-forc1, 50);
axis([0 0.22 -1e-2 1e-2])
figure 
contourf(Hc1, Hu1, forc1, 50);
axis([0 0.22 -1e-2 1e-2])
figure
contourf(Hc1, Hu1, forc2, 50);
axis([0 0.22 -1e-2 1e-2])

forc3 = forc2-forc1; 
forc4 = rot90(forc3',2);
forc5 = forc3 - forc4; 
figure
contourf(Hc1, Hu1, forc5, 50);
axis([0 0.22 -1e-2 1e-2])
%M = FORC(f, V, Tc, 20+273, 10, tau0, shape);
% 
% mr2 = AcquireTRM(mr , V, Tc, 20+273, 580+273, 100e3*yr, H0,         tau0, shape); 
% mr3 = AcquireVRM(mr2, V, Tc, 20+273, 100e3*yr, Rot(H0,-90), tau0, shape);
% 
% save(sprintf('..\\Temp\\Ms %03d.mat', scenario_number));
%load(sprintf('..\\Temp\\Ms %03d.mat', scenario_number));
    

%PlotSample(scenario_number, scenario_description, f, mr3, V, Tc, tau0, shape)

% save(sprintf('..\\Temp\\Ms %03d.mat', scenario_number));