
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

PlotSample(scenario_number, scenario_description, f, mr3, V, Tc, tau0, shape)
% 
% save(sprintf('..\\Temp\\Ms %03d.mat', scenario_number));