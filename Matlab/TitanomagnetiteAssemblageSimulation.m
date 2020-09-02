

maxTc = 580; 
N = 1;  
tau0 = 1e-10;
Ms0 = 480e3; 
mu0 = pi*4e-7; 
kB = 1.38e-23;
yr = 3600*24*365.25;


v = logspace(log10(10e-9^3), log10(50e-9^3),5000);
tc = linspace(580+273, 0+273, 50);
[V, Tc] = meshgrid(v, tc);

% Homogeneous
% muV  = Inf;
% muTc = Inf; 
% muCor = Inf; 

% No correlation, const Tc
% muV  = 1e1;
% muTc = 1e3; 
% muCor = Inf; 

% No correlation, Tc distribution
% muV  = 1e1;
% muTc = 1e5; 
% muCor = Inf; 

% Strong correlation
% muV  = Inf;
% muTc = Inf; 
% muCor = 1e-1; 

% Weak correlation
% muV  = Inf;
% muTc = Inf; 
% muCor = 1e1; 

% Strong correlation and smooth distribution
muV  = 1e3;
muTc = 1e5; 
muCor = 1e0; 

% Weak correlation and smooth distribution
% muV  = 1e3;
% muTc = 1e5; 
% muCor = 1e1; 

f = 1e5 * exp(-((log(V)-log(10e-9^3)).^2/muV + ...
               (Tc-(580+273)).^2/muTc + ...
               ((log(V)-log(10e-9^3))./0.4 + (Tc-(580+273))./50).^2/muCor));
           
%f = 1e5 * ones(size(V));
           
f(f<1) = 0; 
%f(Tc<100+273) = 0;

figure(1);
clf
subplot(2,2,1);
contourf(V.^(1/3)/1e-9,Tc-273,log10(f)); 
colorbar
xlabel('Volume [nm]'); 
ylabel('T_c [C]'); 
title('f(V,T_c)'); 
set(gca,'xscale','log')
grid on


t_A = 1;
T_A = 200+273;
ms = Ms0 * sqrt(1 - (T_A./Tc)); 
t_relax = tau0 .* exp(mu0*N.*V.*ms.^2 ./ (2*kB*T_A));
mr = 1-exp(-t_A./t_relax);
Mr = f.*mr.*V;



subplot(2,2,2);
lt = log10(t_relax);
lt(lt<1) = NaN; 
lt(lt>16.5) = NaN;
contourf(V.^(1/3)/1e-9,Tc-273,lt); 
colorbar
xlabel('Volume [nm]'); 
ylabel('T_c [C]'); 
title('t_{relax}(V,T_c) [s]'); 
set(gca,'xscale','log')
grid on





subplot(2,2,3);
contourf(V.^(1/3)/1e-9,Tc-273,mr); 
colorbar
xlabel('Volume [nm]'); 
ylabel('T_c [C]'); 
title('m_r(V,T_c)'); 
set(gca,'xscale','log')
grid on





subplot(2,2,4);
contourf(V.^(1/3)/1e-9,Tc-273,Mr); 
colorbar
xlabel('Volume [nm]'); 
ylabel('T_c [C]'); 
title('M_r(V,T_c)'); 
set(gca,'xscale','log')
grid on





figure(2)
T = linspace(273,580+273);
t_A = 1;
Mr_tot = zeros(size(T));
for n = 1:length(T)
    T_A = T(n); 
    ms = Ms0 * sqrt(1 - (T_A./Tc)); 
    t_relax = tau0 .* exp(mu0*N.*V.*ms.^2 ./ (2*kB*T_A));
    mr = 1-exp(-t_A./t_relax);
    Mr = f.*mr.*V;
    Mr_tot(n) = sum(sum(Mr)); 
end

plot(T-273, max(Mr_tot)-Mr_tot); 
xlabel('T_A [C]');
ylabel('-Total M_r'); 
title('-Total M_r(T_A)'); 
grid on












figure(3)

T_A = 580+273; 
t_A = 1e5*yr;

ms = Ms0 * sqrt(1 - (T_A./Tc)); 
t_relax = tau0 .* exp(mu0*N.*V.*ms.^2 ./ (2*kB*T_A));
mr = 1-exp(-t_A./t_relax);

T_A = 30+273; 
t_A = 1e5*yr;
Meq = -1; 

ms = Ms0 * sqrt(1 - (T_A./Tc)); 
t_relax = tau0 .* exp(mu0*N.*V.*ms.^2 ./ (2*kB*T_A));
mr = mr .* exp(-t_A./t_relax) + Meq * (1-exp(-t_A./t_relax));
Mr = f.*mr.*V;





subplot(2,2,1);
contourf(V.^(1/3)/1e-9,Tc-273,Mr); 
colorbar
xlabel('Volume [nm]'); 
ylabel('T_c [C]'); 
title('M_r(V,T_c) just after acq. 200C, 100ka'); 
set(gca,'xscale','log')
grid on





t_D = 1;
T_D = 200+273;
ms = Ms0 * sqrt(1 - (T_D./Tc)); 
t_relax = tau0 .* exp(mu0*N.*V.*ms.^2 ./ (2*kB*T_D));
mr_D = mr .* exp(-t_D./t_relax);
Mr_D = f.*mr_D.*V;



subplot(2,2,2);
lt = log10(t_relax);
lt(lt<1) = NaN; 
lt(lt>16.5) = NaN;
contourf(V.^(1/3)/1e-9,Tc-273,lt); 
colorbar
xlabel('Volume [nm]'); 
ylabel('T_c [C]'); 
title('t_{relax}(V,T_c) [s]'); 
set(gca,'xscale','log')
grid on





subplot(2,2,3);
contourf(V.^(1/3)/1e-9,Tc-273,mr_D); 
colorbar
xlabel('Volume [nm]'); 
ylabel('T_c [C]'); 
title('m_r(V,T_c)'); 
set(gca,'xscale','log')
grid on





subplot(2,2,4);
contourf(V.^(1/3)/1e-9,Tc-273,Mr_D); 
colorbar
xlabel('Volume [nm]'); 
ylabel('T_c [C]'); 
title('M_r(V,T_c)'); 
set(gca,'xscale','log')
grid on












T = linspace(273,580+273);
t_D = 1;
Mr_A_tot = zeros(size(T));
Mr_D_tot = zeros(size(T));
for n = 1:length(T)
    ms = Ms0 * sqrt(1 - (T(n)./Tc)); 
    t_relax = tau0 .* exp(mu0*N.*V.*ms.^2 ./ (2*kB*T(n)));
    mr_A = mr .* exp(-t_A./t_relax);
    mr_D = mr .* exp(-t_D./t_relax);
    Mr_A = f.*mr_A.*V;
    Mr_D = f.*mr_D.*V;
    Mr_A_tot(n) = sum(sum(Mr_A)); 
    Mr_D_tot(n) = sum(sum(Mr_D)); 
end

figure(4)
clf
subplot(2,1,1);
plot(T-273, Mr_A_tot, T-273, Mr_D_tot); 
legend('At t_{acq} speed', 'At t_{demag} speed'); 
xlabel('T_A [C]');
ylabel('Total M_r'); 
title('Total M_r(T_A)'); 
grid on

subplot(2,1,2);
smoothing = 1e-2;
[~,dMr_A_tot] = SmoothM(Mr_A_tot', T', smoothing);
[~,dMr_D_tot] = SmoothM(Mr_D_tot', T', smoothing);
[~,dMr_tot] = SmoothM(Mr_tot', T', smoothing);
plot(T-273, dMr_A_tot./dMr_tot, T-273, dMr_D_tot./dMr_tot); 
legend('At t_{acq} speed', 'At t_{demag} speed'); 
xlabel('T_A [C]');
ylabel('Total dM_r/dM_{trm}'); 
title('Total M_r(T_A)'); 
grid on
