
[V, Tc, mr, yr] = SetupVariables();

scenario_number = 254; 
scenario_description = 'Titanomagnetite distribution. N=0.5. Primary TRM 100ka, secondary VRM 100ka. '; 
shape = 0.5;
tau0 = 1e-10;
H0 = [0; 30e-6]; 


f = 1e8 * exp(-6*((Tc-580-273)/580).^2 ...
              -1e3*((log(V)-log(10e-9^3))/8.2 ...
              +((Tc -580-273)/580)).^2);

f(f<1) = 0; 
%PlotGrainDistribution(   scenario_number, scenario_description, f, V, Tc); 
[H, M] = HysteresisLoop(f, V, Tc, 20+273, 360, tau0, shape);
PlotHysteresis(H, M); 

