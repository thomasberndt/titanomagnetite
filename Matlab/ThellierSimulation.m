

N = 0.5;  
tau0 = 1e-10;
mu0 = pi*4e-7; 
kB = 1.38e-23;
yr = 3600*24*365.25;
H0 = [30e-6; 0]; 

[V, Tc] = meshgrid(logspace(log10(10e-9^3), log10(100e-9^3),1000), ...
                   linspace(580+273, 0+273, 100));
mr = zeros(size(V,1), size(V,2), 2);  
t_A = 100*yr; 
mr = AcquireTRMnewtonian(mr, V, Tc, 273, 580+273, t_A, H0, tau0, N); 

    
% f = GrainDistribution(V, Tc, Inf, Inf, Inf);      % Homogeneous
   f = GrainDistribution(V, Tc, 3, 1e2, Inf);      % No correlation, const Tc
% f = GrainDistribution(V, Tc, Inf, 1e3, Inf);      % No correlation, Tc distribution
% f = GrainDistribution(V, Tc, 5, 1e5, Inf);        % Tc and V distribution
% f = GrainDistribution(V, Tc, Inf, Inf, 1e-1);     % Strong correlation
% f = GrainDistribution(V, Tc, Inf, Inf, 1e1);      % Weak correlation
% f = GrainDistribution(V, Tc, 1e3, 1e5, 1e0);      % Strong correlation and smooth distribution
  % f = GrainDistribution(V, Tc, 1e3, 1e5, 1e1);      % Weak correlation and smooth distribution
% f = GrainDistribution(V, Tc, 1e3, 1e5, 5e-1);      % Weak correlation and smoother distribution
% f = GrainDistribution(V, Tc, 1e0, Inf, Inf);        % No cor, V distribution



%     f = 1e8 * exp(-((log(V)-log(10e-9^3)).^2/3 + ...
%                    (Tc-(580+273)).^2/1000)) + ...
%         1e6 * exp(-((log(V)-log(40e-9^3)).^2/1 + ...
%                    (Tc-(200+273)).^2/1000));
%     
    f(f<1) = 0; 


figure(1);
PlotGrainDistribution(f, V, Tc); 
maxNRM = MeasureNRM(mr, Tc, f, V); 
maxNRM = maxNRM(1); 

T = [0:25:300, 325:25:580] + 273;
NRM = NaN * zeros(size(T)); 
pTRM = NaN * zeros(size(T)); 
H0_lab = H0; 
t_lab = 300;

figure(20); 
clf

for n = 1:length(T)
    
    mr = AcquireTRM(mr, V, Tc, 273, T(n), t_lab, [0; 0], tau0, N); 
    nrm = MeasureNRM(mr, Tc, f, V); 
    nrm = nrm(1); 
    NRM(n) = nrm; 
    
    subplot(2,1,1); 
    
    plot(T(n)-273, nrm, 'ob'); 
    xlim([0, 580]);
    ylim([0, maxNRM]); 
    xlabel('Temperature [C]'); 
    ylabel('NRM/pTRM');
    grid on
    grid minor
    hold on
    
    mr = AcquireTRM(mr, V, Tc, 273, T(n), t_lab, H0_lab, tau0, N); 
    ptrm = MeasureNRM(mr, Tc, f, V) - nrm; 
    ptrm = ptrm(1);
    pTRM(n) = ptrm; 
    plot(T(n)-273, ptrm, 'sr'); 
    legend('NRM', 'pTRM'); 
    
    subplot(2,1,2);
    plot(ptrm, nrm, 'sk'); 
    xlim([0, maxNRM]);
    ylim([0, maxNRM]);
    xlabel('pTRM'); 
    ylabel('NRM');
    grid on
    grid minor
    hold on
    
    drawnow;
end



