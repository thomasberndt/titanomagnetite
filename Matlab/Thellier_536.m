
[V, Tc, mr, yr] = SetupVariables();

scenario_number = 536; 
scenario_description = 'Bimodal. N=0.5. Primary TRM 1 h. '; 
shape = 0.5;
tau0 = 1e-10;
H0 = [30e-6; 0]; 

f = 1e8 * exp(-(log(V)-log(10e-9^3)).^2/3 ...
              -(Tc-(580+273)).^2/1e3) + ...
      8e5 * exp(-(log(V)-log(30e-9^3)).^2/2 ...
              -(Tc-(200+273)).^2/1e3);

f(f<1) = 0; 

mr3 = AcquireTRM(mr , V, Tc, 20+273, 580+273, 3600, H0,         tau0, shape); 

save(sprintf('..\\Temp\\Ms %03d.mat', scenario_number));

T = [20:20:400 450 500 550] + 273; 
[NRM, pTRM, m, b] = Thellier(scenario_number, scenario_description, ...
            f, mr3, V, Tc, tau0, shape, H0, 600, T); 
save(sprintf('..\\Temp\\Ms %03d.mat', scenario_number));