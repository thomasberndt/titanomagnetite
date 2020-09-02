
[V, Tc, mr, yr] = SetupVariablesPure();

scenario_number = 1001; 
scenario_description = 'TRM+VRM'; 
shape = 0.5;
tau0 = 1e-10;
H0 = [30e-6; 0]; 
% H0 = gpuArray(H0); 

f = 1e8 * exp(-(log(V)-log(10e-9^3)).^2/4);

f(f<1) = 0; 
f(Tc<580+273) = 0; 
% f = gpuArray(f); 

mr1 = AcquireTRM(mr, V, Tc, 20+273, 580+273, 3600, H0, tau0, shape); 
mr2 = mr1;
for n = 1:3999
    mr2 = AcquireVRM(mr2, V, Tc, 20+273, 1e6*yr, (mod(n,2)*2-1)*H0, tau0, shape); 
end
mr3 = m
% save(sprintf('..\\Temp\\Ms %03d.mat', scenario_number));

T = [20:10:570] + 273; 
[NRM, pTRM, m, b] = Thellier(scenario_number, scenario_description, ...
            f, mr2, V, Tc, tau0, shape, H0, 600, T); 
% save(sprintf('..\\Temp\\Ms %03d.mat', scenario_number));