
[V, Tc, mr, yr] = SetupVariables();

scenario_number = 46; 
scenario_description = 'Bimodal. N=0.5. Primary TRM 100ka, secondary TRM 100ka. '; 
shape = 0.5;
tau0 = 1e-10;
H0 = [0; 30e-6]; 

% f = 1e8 * exp(-(log(V)-log(10e-9^3)).^2/3 ...
%               -(Tc-(580+273)).^2/1e3) + ...
%       8e5 * exp(-(log(V)-log(30e-9^3)).^2/2 ...
%               -(Tc-(200+273)).^2/1e3);
% 
% f(f<1) = 0; 
% PlotGrainDistribution(   scenario_number, scenario_description, f, V, Tc); 
% 
% text(1.1e1, 550, 'Magnetite', 'BackgroundColor', 'w', 'FontSize', 11, 'VerticalAlignment', 'Middle', 'HorizontalAlignment', 'Left');
% text(3e1, 200, 'TM60', 'BackgroundColor', 'w', 'FontSize', 11, 'VerticalAlignment', 'Middle', 'HorizontalAlignment', 'Center');
% 
% set(gcf,'PaperPositionMode','auto');
% saveas(gcf, sprintf('..\\Output\\GrainDistributions\\f %03d. %s.png',scenario_number, scenario_description), 'png');
% saveas(gcf, sprintf('..\\Output\\GrainDistributions\\f %03d.eps',scenario_number), 'epsc');


% mr2 = AcquireTRM(mr , V, Tc, 20+273, 580+273, 100e3*yr, H0,         tau0, shape); 
% mr3 = AcquireTRM(mr2, V, Tc, 20+273, 100+273, 100e3*yr, Rot(H0,-90), tau0, shape);

load(sprintf('..\\Temp\\Ms %03d.mat', scenario_number));
%save(sprintf('..\\Temp\\Ms %03d.mat', scenario_number));
% 
PlotMomentDistributionPpt(scenario_number, scenario_description, f, mr2, V, Tc, tau0, shape); 
saveas(gcf, '..\\Output\\Ppt\\Bimodal TRM 100ka 1.png', 'png');


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

saveas(gcf, '..\\Output\\Ppt\\Bimodal TRM 100ka 2.png', 'png');

yr = 3600*24*365.25; 
    fs = 15; 
    fs2 = 20; 
    

hold on

[vv, Tcc, hh] = DrawActivationLine(100+273, 50000*yr, tau0, shape, 'k-', 4);

saveas(gcf, '..\\Output\\Ppt\\Bimodal TRM 100ka 3.png', 'png');



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

saveas(gcf, '..\\Output\\Ppt\\Bimodal TRM 100ka 4.png', 'png');

hold on

[vv, Tcc, hh] = DrawActivationLine(100+273, 50000*yr, tau0, shape, 'k-', 4);

saveas(gcf, '..\\Output\\Ppt\\Bimodal TRM 100ka 5.png', 'png');











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

hold on

[vv, Tcc, hh] = DrawActivationLine(140+273, 600, tau0, shape, 'k-', 4);

saveas(gcf, '..\\Output\\Ppt\\Bimodal TRM 100ka 6.png', 'png');














mr4 = AcquireVRM(mr3, V, Tc, 140+273, 600, [0 0], tau0, shape);



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

saveas(gcf, '..\\Output\\Ppt\\Bimodal TRM 100ka 7.png', 'png');


hold on

[vv, Tcc, hh] = DrawActivationLine(140+273, 600, tau0, shape, 'k-', 4);

saveas(gcf, '..\\Output\\Ppt\\Bimodal TRM 100ka 8.png', 'png');



[vv, Tcc, hh] = DrawActivationLine(210+273, 600, tau0, shape, 'k-', 4);
saveas(gcf, '..\\Output\\Ppt\\Bimodal TRM 100ka 9.png', 'png');











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

[vv, Tcc, hh] = DrawActivationLine(210+273, 600, tau0, shape, 'k-', 4);

saveas(gcf, '..\\Output\\Ppt\\Bimodal TRM 100ka 11.png', 'png');






mr5 = AcquireVRM(mr4, V, Tc, 210+273, 600, [0 0], tau0, shape);





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


saveas(gcf, '..\\Output\\Ppt\\Bimodal TRM 100ka 12.png', 'png');

hold on

[vv, Tcc, hh] = DrawActivationLine(210+273, 600, tau0, shape, 'k-', 4);

saveas(gcf, '..\\Output\\Ppt\\Bimodal TRM 100ka 13.png', 'png');















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

hold on
[vv, Tcc, hh] = DrawActivationLine(100+273, 600, tau0, shape, 'k-', 4);

saveas(gcf, '..\\Output\\Ppt\\Bimodal TRM 100ka 14.png', 'png');









mr6 = AcquireVRM(mr3, V, Tc, 100+273, 600, [0 0], tau0, shape);



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



saveas(gcf, '..\\Output\\Ppt\\Bimodal TRM 100ka 15.png', 'png');

hold on
[vv, Tcc, hh] = DrawActivationLine(100+273, 600, tau0, shape, 'k-', 4);

saveas(gcf, '..\\Output\\Ppt\\Bimodal TRM 100ka 16.png', 'png');
















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

hold on
[vv, Tcc, hh] = DrawActivationLine(140+273, 600, tau0, shape, 'k-', 4);

saveas(gcf, '..\\Output\\Ppt\\Bimodal TRM 100ka 17.png', 'png');

