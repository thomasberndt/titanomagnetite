

mu0 = pi*4e-7; 
kB = 1.38e-23;
tau0 = 1e-10; 
V = 10e-9 ^ 3; 
T = 393; 
shape = 0.5; 
Ms0 = 480e3; 
ms = Ms0; 
mu0H0 = linspace(0,1,100); 




t_12 = tau0 .* exp(V ./ (2*kB*T) .* (mu0*shape.*ms.^2 + 2*mu0H0.*ms + mu0H0.^2./(mu0*shape)) );
t_21 = tau0 .* exp(V ./ (2*kB*T) .* (mu0*shape.*ms.^2 - 2*mu0H0.*ms + mu0H0.^2./(mu0*shape)) );


t_12 = tau0 .* exp(mu0 * V .* ms.^2.*shape ./ (2*kB*T) .* (1 + abs(mu0H0/mu0)./(shape.*ms)).^ 2);
t_21 = tau0 .* exp(mu0 * V .* ms.^2.*shape ./ (2*kB*T) .* (1 - abs(mu0H0/mu0)./(shape.*ms)).^ 2);

t_relax = 1 ./ (1./t_12 + 1./t_21); 

semilogy(mu0H0, t_12, mu0H0, t_21, mu0H0, t_relax); 
legend('t_{12}', ' t_{21}', 't_{relax}' ); 