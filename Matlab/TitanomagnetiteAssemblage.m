

maxTc = 580; 
N = 1;  
tau0 = 1e-10;
Ms0 = 480e3; 
mu0 = pi*4e-7; 
kB = 1.38e-23;
V = logspace(log10(10e-9^3), log10(50e-9^3),10000);
Tc = linspace(300+273, 0+273, length(V));

mu1 = 1e-4;
mu2 = 1e5; 
f = ones(size(V));
figure(1);
semilogx(V.^(1/3)/1e-9,f); 
xlabel('Volume [nm]'); 
ylabel('T_c [C]'); 
title('f(V)'); 
grid on


t_A = 3600*24*365*100000;
T_A = 1 ./ (2*kB*log(t_A/tau0) ./ (mu0*V*N*Ms0^2) + 1./Tc); 

Mr = -ones(size(V));
Mr(T_A<(25+273)) = 1; 

t_B = 1;
TB = 1 ./ (2*kB*log(t_B/tau0) ./ (mu0*V*N*Ms0^2) + 1./Tc); 

figure(2);
semilogx(V.^(1/3) / 1e-9, T_A-273, V.^(1/3) / 1e-9, TB-273, V.^(1/3) / 1e-9,Tc-273)
xlabel('Volume [nm]'); 
ylabel('T [C]');
legend('T_A', 'T_B', 'T_C'); 
grid on

T = linspace(273, maxTc+273, 200); 

MtrmT = zeros(size(T));
Mtrm0 = zeros(size(T));
MrT = zeros(size(T));
for n = 1:length(T)
    block = TB > T(n); 
    MsT =  Ms0 .* sqrt(1 - (T(n)-273)./(Tc-273));
    MsT(Tc<T(n)) = 0; 
    MrT(n) = sum(block .* f .* V .* Mr .* MsT);
    Mr0(n) = sum(block .* f .* V .* Mr .* Ms0);
    Ms(n)  = sum(f .* V .* MsT);
    MtrmT(n) = sum(block .* f .* V .* 1 .* MsT); 
    Mtrm0(n) = sum(block .* f .* V .* 1 .* Ms0); 
end

figure(3);
plot(T-273, MrT, T-273, Mr0, T-273, MtrmT, T-273, Mtrm0, T-273, Ms);
legend('M_r(T)', 'M_r(0)', 'M_{TRM}(T)', 'M_{TRM}(0)', 'M_s(T)'); 

figure(4); 
plot(T(2:end)-273, diff(MrT)./diff(Ms), ...
     T(2:end)-273, diff(Mr0)./diff(Ms), ...
     T(2:end)-273, diff(MrT)./diff(MtrmT), ...
     T(2:end)-273, diff(Mr0)./diff(Mtrm0), ...
     TB(TB>273)-273, Mr(TB>273)); 
legend('dM_r(T)./dM_s', 'dM_r(0)/dM_s', 'dM_r(T)/dM_{TRM}', 'dM_r(0)/dM_{TRM}', 'Actual M_r'); 



figure(5);
Zijderveld([MtrmT', MrT'], T'-273); 
ZijderveldLabel([MtrmT', MrT'], T'-273, 0:10:300); 
xlabel('M_{TRM}(T)'); 
ylabel('M_{r}(T)'); 



figure(6);
Zijderveld([Mtrm0', Mr0'], T'-273); 
ZijderveldLabel([Mtrm0', Mr0'], T'-273, 0:10:300); 
xlabel('M_{TRM}(0)'); 
ylabel('M_{r}(0)'); 


