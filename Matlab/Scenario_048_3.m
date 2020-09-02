
[V, Tc, mr, yr] = SetupVariables();

scenario_number = 48; 
scenario_description = 'Bimodal. N=0.5. Primary TRM 100ka, secondary VRM 100ka. '; 
shape = 0.5;
tau0 = 1e-10;
H0 = 30e-6; 

% f = 1e8 * exp(-(log(V)-log(15e-9^3)).^2/0.015 ...
%               -(Tc-(580+273)).^2/10); % + ...
f =       8e5 * exp(-(log(V)-log(40e-9^3)).^2/1 ...
               -(Tc-(250+273)).^2/1e3);

f(f<1) = 0; 
PlotGrainDistribution(   scenario_number, scenario_description, f, V, Tc, shape, tau0); 
%TitanoExperiment(mr, scenario_number, scenario_description, f, V, Tc, shape, tau0); 
%TitanoHysteresis(mr, scenario_number, scenario_description, f, V, Tc, shape, tau0); 


load('temp048_3.mat')
% [M1, forc1, Hu1, Hc1] = FORC(f, V, Tc, 20+273, 1, 1, tau0, shape);
% [M2, forc2, Hu2, Hc2] = FORC(f, V, Tc, 20+273, 100, 1, tau0, shape);




cyclicmap = 0.5+0.5*[sin(linspace(0, 2*pi)+2/3*pi)' ...
             sin(linspace(0, 2*pi)+4/3*pi)' ... 
             sin(linspace(0, 2*pi))'];

[Hui, Hci] = meshgrid(linspace(-0.02, 0.02, 100), linspace(0.01, 0.2, 100)); 
F = scatteredInterpolant(Hu1(:), Hc1(:), forc1(:)); 
forc1i = F(Hui, Hci); 
rho1 = fft2(forc1i); 
F = scatteredInterpolant(Hu2(:), Hc2(:), forc2(:)); 
forc2i = F(Hui, Hci); 
rho2 = fft2(forc2i); 

figure(22);
[C, h] = contourf(abs(rho1)); 

figure(23);
[C, h] = contourf(angle(rho1));
h.LineStyle = 'none';
colormap(cyclicmap);

figure(222);
[C, h] = contourf(abs(rho2)); 

figure(223);
[C, h] = contourf(angle(rho2));
h.LineStyle = 'none';
colormap(cyclicmap);

figure(2222);
[C, h] = contourf(abs(rho1./rho2)); 

figure(2223);
[C, h] = contourf(angle(rho1./rho2));
h.LineStyle = 'none';
colormap(cyclicmap);





minf = min(forc1(Hc1>0.005)); 
maxf = max(forc1(Hc1>0.005)); 
vl = linspace(minf, maxf, 20);

figure(333)
contourf(Hc1, Hu1, forc1, vl);
axis([0 0.25 -2e-2 2e-2]);

figure(444)
contourf(Hc2, Hu2, forc2, vl);
axis([0 0.25 -2e-2 2e-2]);


% figure(5)
% 
% forc11 = forc1; 
% forc22 = forc2; 
% forc11(isnan(forc11)) = 0; 
% forc22(isnan(forc22)) = 0; 
% Ha = Hu1 - Hc1;
% Hb = Hu1 + Hc1; 
% a = 1 ./ Ha; 
% b = 1 ./ Hb; 
% 
% rho1 = fft2(forc11); 
% rho2 = fft2(forc22); 
% %a(1:end, end/2:end/2+1) = NaN;
% %b(end/2:end/2+1, 1:end) = NaN; 
% 
% [phi1, aa, bb] = MixedDerivative(rho1, a, b);
% 
% figure(5)
% clf
% contourf(a,b,abs(rho1),linspace(0,2,50))
% figure(6) 
% contourf(a,b,abs(rho2),linspace(0,0.05,50))
% 
% rr = rho2./rho1; 
% figure(7)
% contourf(a, b, abs(rr), 50); 
% figure(8)
% contourf(a, b, angle(rr), 50); 
% 
% rri = ifft2(rr); 
% figure(9)
% [C,h] = contourf(Hc1, Hu1, abs(rri), linspace(0,0.05, 50)); 
% h.LineStyle = 'none'; 
% figure(10)
% %[C,h] = contourf(Hc1, Hu1, angle(rri), 50);
% %h.LineStyle = 'none'; 
% cyclicmap = 0.5+0.5*[sin(linspace(0, 2*pi)+2/3*pi)' ...
%              sin(linspace(0, 2*pi)+4/3*pi)' ... 
%              sin(linspace(0, 2*pi))'];
%  colormap(cyclicmap);
% image(
% 
% s1 = surf(a,b,abs(rho1)); 
% s1.FaceAlpha = 0.5;
% s1.FaceColor = 'b'; 
% hold on
% s2 = surf(a,b,abs(rho2)*10); 
% s2.FaceAlpha = 0.5;
% s2.FaceColor = 'r'; 
% zlim([0 2]);
% 
% [forc22, Hc22, Hu22] = MixedDerivative(forc2, Hc2, Hu2); 
% minf22 = min(forc22(Hc22>0.005)); 
% maxf22 = max(forc22(Hc22>0.005)); 
% vl22 = linspace(minf22, maxf22, 50);
% contourf(Hc22, Hu22, forc22, vl22);
% axis([0 0.25 -2e-2 2e-2]);
% grid minor
% grid on
% 
% 

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


% 
% [M2, forc2, Hu2, Hc2] = SimplifiedFORC(f, V, Tc, 20+273, 100, 1, tau0, shape);
% [M1, forc1, Hu1, Hc1] = SimplifiedFORC(f, V, Tc, 20+273, 1, 1, tau0, shape);

% 
% figure(13)
% contourf(Hc1, Hu1, forc1, vl);
% %axis([0 0.25 -2e-2 2e-2]);
% 
% figure(14)
% contourf(Hc2, Hu2, forc2, vl);
% %axis([0 0.25 -2e-2 2e-2]);


%M = FORC(f, V, Tc, 20+273, 10, tau0, shape);
% 
% mr2 = AcquireTRM(mr , V, Tc, 20+273, 580+273, 100e3*yr, H0,         tau0, shape); 
% mr3 = AcquireVRM(mr2, V, Tc, 20+273, 100e3*yr, Rot(H0,-90), tau0, shape);
% 
% save(sprintf('..\\Temp\\Ms %03d.mat', scenario_number));
%load(sprintf('..\\Temp\\Ms %03d.mat', scenario_number));
    

%PlotSample(scenario_number, scenario_description, f, mr3, V, Tc, tau0, shape)

% save(sprintf('..\\Temp\\Ms %03d.mat', scenario_number));

save('temp048_3.mat'); 