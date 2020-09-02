
[V, Tc, mr, yr] = SetupVariables();

scenario_number = 48; 
scenario_description = 'Bimodal. N=0.5. Primary TRM 100ka, secondary VRM 100ka. '; 
shape = 0.5;
tau0 = 1e-10;
H0 = 30e-6; 

f = 1e8 * exp(-(log(V)-log(10e-9^3)).^2/3 ...
              -(Tc-(580+273)).^2/1e3) + ...
      8e5 * exp(-(log(V)-log(30e-9^3)).^2/2 ...
              -(Tc-(200+273)).^2/1e3);

f(f<1) = 0; 
PlotGrainDistribution(   scenario_number, scenario_description, f, V, Tc, shape, tau0); 
%TitanoExperiment(mr, scenario_number, scenario_description, f, V, Tc, shape, tau0); 
%TitanoHysteresis(mr, scenario_number, scenario_description, f, V, Tc, shape, tau0); 


load('temp048.mat')
%[M1, forc1, Hu1, Hc1] = FORC(f, V, Tc, 20+273, 1, 1, tau0, shape);
%[M2, forc2, Hu2, Hc2] = FORC(f, V, Tc, 20+273, 100, 1, tau0, shape);

minf = min(forc1(Hc1>0.005)); 
maxf = max(forc1(Hc1>0.005)); 
vl = linspace(minf, maxf, 50);

figure(33)
contourf(Hc1, Hu1, forc1, vl);
axis([0 0.25 -2e-2 2e-2]);

figure(44)
contourf(Hc2, Hu2, forc2, vl);
axis([0 0.25 -2e-2 2e-2]);


figure(5)

forc11 = forc1; 
forc22 = forc2; 
forc11(isnan(forc11)) = 0; 
forc22(isnan(forc22)) = 0; 
Ha = Hu1 - Hc1;
Hb = Hu1 + Hc1; 
a = 1 ./ Ha; 
b = 1 ./ Hb; 

rho1 = fft2(forc11); 
rho2 = fft2(forc22); 
%a(1:end, end/2:end/2+1) = NaN;
%b(end/2:end/2+1, 1:end) = NaN; 


% 
% forc22 = forc2;
% forc22(isnan(forc22)) = 0; 
% fftforc22 = fft(forc22);
% figure(5);
% contourf(real(fftforc22));
% figure(6);
% contourf(imag(fftforc22));
% 
% 
% 
% forc11 = forc1;
% forc11(isnan(forc11)) = 0; 
% fftforc11 = fft(forc11);
% figure(7);
% contourf(real(fftforc11));
% figure(8);
% contourf(imag(fftforc11));



[M2, forc2, Hu2, Hc2] = SimplifiedFORC(f, V, Tc, 20+273, 100, 1, tau0, shape);
[M1, forc1, Hu1, Hc1] = SimplifiedFORC(f, V, Tc, 20+273, 1, 1, tau0, shape);


figure(13)
contourf(Hc1, Hu1, forc1, vl);
%axis([0 0.25 -2e-2 2e-2]);

figure(14)
contourf(Hc2, Hu2, forc2, vl);
%axis([0 0.25 -2e-2 2e-2]);


%M = FORC(f, V, Tc, 20+273, 10, tau0, shape);
% 
% mr2 = AcquireTRM(mr , V, Tc, 20+273, 580+273, 100e3*yr, H0,         tau0, shape); 
% mr3 = AcquireVRM(mr2, V, Tc, 20+273, 100e3*yr, Rot(H0,-90), tau0, shape);
% 
% save(sprintf('..\\Temp\\Ms %03d.mat', scenario_number));
%load(sprintf('..\\Temp\\Ms %03d.mat', scenario_number));
    

%PlotSample(scenario_number, scenario_description, f, mr3, V, Tc, tau0, shape)

% save(sprintf('..\\Temp\\Ms %03d.mat', scenario_number));