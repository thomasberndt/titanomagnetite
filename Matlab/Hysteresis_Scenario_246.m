
[V, Tc, mr, yr] = SetupVariables();

scenario_number = 46; 
scenario_description = 'Bimodal. N=0.5. Primary TRM 100ka, secondary TRM 100ka. '; 
shape = 0.5;
tau0 = 1e-10;
H0 = [0; 30e-6]; 

f = 1e8 * exp(-(log(V)-log(10e-9^3)).^2/3 ...
              -(Tc-(580+273)).^2/1e3) + ...
      8e5 * exp(-(log(V)-log(30e-9^3)).^2/2 ...
              -(Tc-(200+273)).^2/1e3);


f = 1e8 * exp(-6*((Tc-580-273)/580).^2 ...
              -1e3*((log(V)-log(10e-9^3))/8.2 ...
              +((Tc -580-273)/580)).^2);



% f = 1e8 * exp(-2*((Tc-480-273)/580).^2 ...
%               -2*((log(V)-log(10e-9^3))/3 ...
%               +((Tc -580-273)/580)).^2);

f(f<1) = 0; 
%f(Tc<580+273) = 0; 
%PlotGrainDistribution(   scenario_number, scenario_description, f, V, Tc); 
t = logspace(log10(1), log10(1000), 100); 
id = 401:500; 
[tt, HH] = meshgrid(t, linspace(0, 0.3, 100)); 
MM = zeros(size(HH)); 
for n = 1:length(t)
    [H, M] = HysteresisLoop(f, V, Tc, 20+273, t(n), tau0, shape);
    MM(:,n) = M(id); 
end
dM1 = diff(MM, 1, 1);
HH1 = HH(1:end-1, :);
dM2 = diff(MM, 1, 2);
HH2 = HH(:, 1:end-1);
ddM = diff(dM1, 1, 2); 
HHH = HH(1:end-1,1:end-1);
ttt = tt(1:end-1,1:end-1);
contourf(log10(ttt), HHH, ddM, 100); 
grid on
