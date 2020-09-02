
[V, Tc, mr, yr] = SetupVariables();

scenario_number = 539; 
scenario_description = 'Continuous. N=0.5. Primary TRM 100ka. '; 
shape = 0.5;
tau0 = 1e-10;
H0 = [30e-6; 0]; 

f = 1e8 * exp(-6*((Tc-580-273)/580).^2 ...
              -1e3*((log(V)-log(10e-9^3))/7.9 ...
              +((Tc -580-273)/580)).^2);    % same as 054

f(f<1) = 0; 

mr3 = AcquireTRM(mr , V, Tc, 20+273, 580+273, 100e3*yr, H0,         tau0, shape); 

save(sprintf('..\\Temp\\Ms %03d.mat', scenario_number));

T = [20:10:200] + 273; 
[NRM, pTRM, m, b] = Thellier(scenario_number, scenario_description, ...
            f, mr3, V, Tc, tau0, shape, H0, 600, T); 
save(sprintf('..\\Temp\\Ms %03d.mat', scenario_number));