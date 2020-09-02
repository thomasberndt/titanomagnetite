function [Na, Nb]=demag_fac(a, b)

% Demagnetization factors for prolate spheriods


m=a./b;


L=(1./(m.^2-1) ) .* ( (m./(2.*sqrt(m.^2-1)) ) .* log( ( m+sqrt(m.^2-1) )./( m-sqrt(m.^2-1) ) ) - 1 );

M=(m./(2.*(m.^2-1) )) .* ( m - (1./(2.*sqrt(m.^2-1)) ) .* log( ( m+sqrt(m.^2-1) )./( m-sqrt(m.^2-1) ) ) );

% For a sphere
L(m==1)=1./3;
M(m==1)=1./3;

Na=L;
Nb=M;


end
