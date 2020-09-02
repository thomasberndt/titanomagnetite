
[V, Tc, mr, yr] = SetupVariables();


scenario_number = 47; 
scenario_description = 'Bimodal. N=0.5. Primary TRM 1h, secondary TRM 1h. '; 
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


Htilde = logspace(log10(1e-3), log10(1), 200);  
HtildeLabels = [1 10 20 28 40 55 70 85 100:20:180 220];
Mr = AfDemagnetization(f, mr3, V, Tc, 20+273, 50, Htilde, tau0, shape); 
   
fh = figure(2); 
set(fh, 'Position', [100, 100, 500, 500]);
clf
Zijderveld(Mr, Htilde'*1000, HtildeLabels); 
ZijderveldLabel(Mr, Htilde'*1000, HtildeLabels); 
set(gcf,'PaperPositionMode','auto');
saveas(gcf, '..\\Output\\Ppt\\AF Bimodal TRM 1h Zijderveld AF.png', 'png'); 
    
    
    

clf



PlotMomentDistributionPpt(scenario_number, scenario_description, f, mr2, V, Tc, tau0, shape); 
saveas(gcf, '..\\Output\\Ppt\\AF Bimodal TRM 1h 1.png', 'png');


hold on

Ms0 = CalculateMs0(Tc);
m1 = mr2(:,:,1).*V.*f.*Ms0; 
m2 = mr2(:,:,2).*V.*f.*Ms0; 

maxMr = max(max(m1(:)),max(m2(:))); 
if maxMr == 0
    c = 0;
else
    c = logspace(log10(maxMr)-2, log10(maxMr),10); 
end


contourf(V.^(1/3)/1e-9, Tc-273, real(m2), c); 
colormap(flipud(colormap('autumn')));

saveas(gcf, '..\\Output\\Ppt\\AF Bimodal TRM 1h 2.png', 'png');

yr = 3600*24*365.25; 
    fs = 15; 
    fs2 = 20; 
    

hold on

[vv, Tcc, hh] = DrawActivationLine(100+273, 3600, tau0, shape, 'k-', 4);

saveas(gcf, '..\\Output\\Ppt\\AF Bimodal TRM 1h 3.png', 'png');



clf
PlotMomentDistributionPpt(scenario_number, scenario_description, f, mr2, V, Tc, tau0, shape); 


hold on

Ms0 = CalculateMs0(Tc);
m1 = mr3(:,:,1).*V.*f.*Ms0; 
m2 = mr3(:,:,2).*V.*f.*Ms0; 

maxMr = max(max(m1(:)),max(m2(:))); 
if maxMr == 0
    c = 0;
else
    c = logspace(log10(maxMr)-2, log10(maxMr),10); 
end

ax1 = axes; 
[C1,h1] = contourf(V.^(1/3)/1e-9, Tc-273, real(m2), c); 
colormap(ax1, flipud(colormap('autumn')));

set(gca,'xscale','log')
grid on
xlim([1e1 1e2])
ax = gca; 
ax.XAxis.TickValues = 10:10:100;
    
    
hold on
ax2 = axes; 
[C2,h2] = contourf(V.^(1/3)/1e-9, Tc-273, real(m1), c); 
colormap(ax2, flipud(colormap('winter')));

set(gca,'xscale','log')
grid on
xlim([1e1 1e2])
ax = gca; 
ax.XAxis.TickValues = 10:10:100;
    
    
linkaxes([ax1, ax2]); 

set(ax1, 'visible', 'off');
set(ax1, 'XTick', []);
set(ax1, 'YTick', []);

set(ax2, 'visible', 'off');
set(ax2, 'XTick', []);
set(ax2, 'YTick', []);

saveas(gcf, '..\\Output\\Ppt\\AF Bimodal TRM 1h 4.png', 'png');

hold on

[vv, Tcc, hh] = DrawActivationLine(100+273, 3600, tau0, shape, 'k-', 4);

saveas(gcf, '..\\Output\\Ppt\\AF Bimodal TRM 1h 5.png', 'png');











clf
PlotMomentDistributionPpt(scenario_number, scenario_description, f, mr2, V, Tc, tau0, shape); 


hold on

Ms0 = CalculateMs0(Tc);
m1 = mr3(:,:,1).*V.*f.*Ms0; 
m2 = mr3(:,:,2).*V.*f.*Ms0; 

maxMr = max(max(m1(:)),max(m2(:))); 
if maxMr == 0
    c = 0;
else
    c = logspace(log10(maxMr)-2, log10(maxMr),10); 
end

ax1 = axes; 
[C1,h1] = contourf(V.^(1/3)/1e-9, Tc-273, real(m2), c); 
colormap(ax1, flipud(colormap('autumn')));

set(gca,'xscale','log')
grid on
xlim([1e1 1e2])
ax = gca; 
ax.XAxis.TickValues = 10:10:100;
    
    
hold on
ax2 = axes; 
[C2,h2] = contourf(V.^(1/3)/1e-9, Tc-273, real(m1), c); 
colormap(ax2, flipud(colormap('winter')));

set(gca,'xscale','log')
grid on
xlim([1e1 1e2])
ax = gca; 
ax.XAxis.TickValues = 10:10:100;
    
hold on
[vv, Tcc, hh] = DrawAfActivationLine(0.028, 20+273, 50, tau0, shape, 'k-', 4);
    
linkaxes([ax1, ax2]); 

set(ax1, 'visible', 'off');
set(ax1, 'XTick', []);
set(ax1, 'YTick', []);

set(ax2, 'visible', 'off');
set(ax2, 'XTick', []);
set(ax2, 'YTick', []);



saveas(gcf, '..\\Output\\Ppt\\AF Bimodal TRM 1h 6.png', 'png');














mr4 = AcquireAF(mr3, V, Tc, 20+273, 50, 0.028, tau0, shape);



clf
PlotMomentDistributionPpt(scenario_number, scenario_description, f, mr2, V, Tc, tau0, shape); 
hold on

Ms0 = CalculateMs0(Tc);
m1 = mr4(:,:,1).*V.*f.*Ms0; 
m2 = mr4(:,:,2).*V.*f.*Ms0; 

maxMr = max(max(m1(:)),max(m2(:))); 
if maxMr == 0
    c = 0;
else
    c = logspace(log10(maxMr)-2, log10(maxMr),10); 
end

ax1 = axes; 
[C1,h1] = contourf(V.^(1/3)/1e-9, Tc-273, real(m2), c); 
colormap(ax1, flipud(colormap('autumn')));

set(gca,'xscale','log')
grid on
xlim([1e1 1e2])
ax = gca; 
ax.XAxis.TickValues = 10:10:100;
    
    
hold on
ax2 = axes; 
[C2,h2] = contourf(V.^(1/3)/1e-9, Tc-273, real(m1), c); 
colormap(ax2, flipud(colormap('winter')));

set(gca,'xscale','log')
grid on
xlim([1e1 1e2])
ax = gca; 
ax.XAxis.TickValues = 10:10:100;
    
    
linkaxes([ax1, ax2]); 

set(ax1, 'visible', 'off');
set(ax1, 'XTick', []);
set(ax1, 'YTick', []);

set(ax2, 'visible', 'off');
set(ax2, 'XTick', []);
set(ax2, 'YTick', []);

saveas(gcf, '..\\Output\\Ppt\\AF Bimodal TRM 1h 7.png', 'png');


hold on

[vv, Tcc, hh] = DrawAfActivationLine(0.028, 20+273, 50, tau0, shape, 'k-', 4);

saveas(gcf, '..\\Output\\Ppt\\AF Bimodal TRM 1h 8.png', 'png');



[vv, Tcc, hh] = DrawAfActivationLine(0.060, 20+273, 50, tau0, shape, 'k-', 4);
saveas(gcf, '..\\Output\\Ppt\\AF Bimodal TRM 1h 9.png', 'png');











clf
PlotMomentDistributionPpt(scenario_number, scenario_description, f, mr2, V, Tc, tau0, shape); 
hold on

Ms0 = CalculateMs0(Tc);
m1 = mr4(:,:,1).*V.*f.*Ms0; 
m2 = mr4(:,:,2).*V.*f.*Ms0; 

maxMr = max(max(m1(:)),max(m2(:))); 
if maxMr == 0
    c = 0;
else
    c = logspace(log10(maxMr)-2, log10(maxMr),10); 
end

ax1 = axes; 
[C1,h1] = contourf(V.^(1/3)/1e-9, Tc-273, real(m2), c); 
colormap(ax1, flipud(colormap('autumn')));

set(gca,'xscale','log')
grid on
xlim([1e1 1e2])
ax = gca; 
ax.XAxis.TickValues = 10:10:100;
    
    
hold on
ax2 = axes; 
[C2,h2] = contourf(V.^(1/3)/1e-9, Tc-273, real(m1), c); 
colormap(ax2, flipud(colormap('winter')));

set(gca,'xscale','log')
grid on
xlim([1e1 1e2])
ax = gca; 
ax.XAxis.TickValues = 10:10:100;
    
    
linkaxes([ax1, ax2]); 

set(ax1, 'visible', 'off');
set(ax1, 'XTick', []);
set(ax1, 'YTick', []);

set(ax2, 'visible', 'off');
set(ax2, 'XTick', []);
set(ax2, 'YTick', []);

hold on

[vv, Tcc, hh] = DrawAfActivationLine(0.060, 20+273, 50, tau0, shape, 'k-', 4);

saveas(gcf, '..\\Output\\Ppt\\AF Bimodal TRM 1h 11.png', 'png');






mr5 = AcquireAF(mr3, V, Tc, 20+273, 50, 0.060, tau0, shape);




clf
PlotMomentDistributionPpt(scenario_number, scenario_description, f, mr2, V, Tc, tau0, shape); 
hold on

Ms0 = CalculateMs0(Tc);
m1 = mr5(:,:,1).*V.*f.*Ms0; 
m2 = mr5(:,:,2).*V.*f.*Ms0; 

maxMr = max(max(m1(:)),max(m2(:))); 
if maxMr == 0
    c = 0;
else
    c = logspace(log10(maxMr)-2, log10(maxMr),10); 
end

ax1 = axes; 
[C1,h1] = contourf(V.^(1/3)/1e-9, Tc-273, real(m2), c); 
colormap(ax1, flipud(colormap('autumn')));

set(gca,'xscale','log')
grid on
xlim([1e1 1e2])
ax = gca; 
ax.XAxis.TickValues = 10:10:100;
    
    
hold on
ax2 = axes; 
[C2,h2] = contourf(V.^(1/3)/1e-9, Tc-273, real(m1), c); 
colormap(ax2, flipud(colormap('winter')));

set(gca,'xscale','log')
grid on
xlim([1e1 1e2])
ax = gca; 
ax.XAxis.TickValues = 10:10:100;
    
    
linkaxes([ax1, ax2]); 

set(ax1, 'visible', 'off');
set(ax1, 'XTick', []);
set(ax1, 'YTick', []);

set(ax2, 'visible', 'off');
set(ax2, 'XTick', []);
set(ax2, 'YTick', []);


saveas(gcf, '..\\Output\\Ppt\\AF Bimodal TRM 1h 12.png', 'png');

hold on

[vv, Tcc, hh] = DrawAfActivationLine(0.060, 20+273, 50, tau0, shape, 'k-', 4);

saveas(gcf, '..\\Output\\Ppt\\AF Bimodal TRM 1h 13.png', 'png');


[vv, Tcc, hh] = DrawAfActivationLine(0.090, 20+273, 50, tau0, shape, 'k-', 4);

saveas(gcf, '..\\Output\\Ppt\\AF Bimodal TRM 1h 19.png', 'png');
















mr6 = AcquireAF(mr3, V, Tc, 20+273, 50, 0.090, tau0, shape);



clf
PlotMomentDistributionPpt(scenario_number, scenario_description, f, mr2, V, Tc, tau0, shape); 
hold on

Ms0 = CalculateMs0(Tc);
m1 = mr6(:,:,1).*V.*f.*Ms0; 
m2 = mr6(:,:,2).*V.*f.*Ms0; 

maxMr = max(max(m1(:)),max(m2(:))); 
if maxMr == 0
    c = 0;
else
    c = logspace(log10(maxMr)-2, log10(maxMr),10); 
end

ax1 = axes; 
[C1,h1] = contourf(V.^(1/3)/1e-9, Tc-273, real(m2), c); 
colormap(ax1, flipud(colormap('autumn')));

set(gca,'xscale','log')
grid on
xlim([1e1 1e2])
ax = gca; 
ax.XAxis.TickValues = 10:10:100;
    
    
hold on
ax2 = axes; 
[C2,h2] = contourf(V.^(1/3)/1e-9, Tc-273, real(m1), c); 
colormap(ax2, flipud(colormap('winter')));

set(gca,'xscale','log')
grid on
xlim([1e1 1e2])
ax = gca; 
ax.XAxis.TickValues = 10:10:100;
    
    
linkaxes([ax1, ax2]); 

set(ax1, 'visible', 'off');
set(ax1, 'XTick', []);
set(ax1, 'YTick', []);

set(ax2, 'visible', 'off');
set(ax2, 'XTick', []);
set(ax2, 'YTick', []);

saveas(gcf, '..\\Output\\Ppt\\AF Bimodal TRM 1h 17.png', 'png');


hold on
[vv, Tcc, hh] = DrawAfActivationLine(0.090, 20+273, 50, tau0, shape, 'k-', 4);

saveas(gcf, '..\\Output\\Ppt\\AF Bimodal TRM 1h 18.png', 'png');












clf
PlotMomentDistributionPpt(scenario_number, scenario_description, f, mr2, V, Tc, tau0, shape); 
hold on

Ms0 = CalculateMs0(Tc);
m1 = mr5(:,:,1).*V.*f.*Ms0; 
m2 = mr5(:,:,2).*V.*f.*Ms0; 

maxMr = max(max(m1(:)),max(m2(:))); 
if maxMr == 0
    c = 0;
else
    c = logspace(log10(maxMr)-2, log10(maxMr),10); 
end

ax1 = axes; 
[C1,h1] = contourf(V.^(1/3)/1e-9, Tc-273, real(m2), c); 
colormap(ax1, flipud(colormap('autumn')));

set(gca,'xscale','log')
grid on
xlim([1e1 1e2])
ax = gca; 
ax.XAxis.TickValues = 10:10:100;
    
    
hold on
ax2 = axes; 
[C2,h2] = contourf(V.^(1/3)/1e-9, Tc-273, real(m1), c); 
colormap(ax2, flipud(colormap('winter')));

set(gca,'xscale','log')
grid on
xlim([1e1 1e2])
ax = gca; 
ax.XAxis.TickValues = 10:10:100;
    
    
linkaxes([ax1, ax2]); 

set(ax1, 'visible', 'off');
set(ax1, 'XTick', []);
set(ax1, 'YTick', []);

set(ax2, 'visible', 'off');
set(ax2, 'XTick', []);
set(ax2, 'YTick', []);

hold on

[vv, Tcc, hh] = DrawAfActivationLine(0.090, 20+273, 50, tau0, shape, 'k-', 4);

saveas(gcf, '..\\Output\\Ppt\\AF Bimodal TRM 1h 20.png', 'png');