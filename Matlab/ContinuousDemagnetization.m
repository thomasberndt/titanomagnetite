function [Mr, T] = ContinuousDemagnetization(f, mr, V, Tc, T, t, tau0, shape)
    
    Mr = zeros(length(T), 2); 
    Ms0 = CalculateMs0(Tc);
    for n = 1:length(T)
        mr = AcquireVRM(mr, V, Tc, T(n), t./length(T), [0, 0], tau0, shape); 
        ms = Ms0 .* sqrt(1 - (T(n)./Tc)); 
        ms(T(n)>Tc) = 0; 
        Mr(n,1) = sum(sum(ms.*mr(:,:,1).*f.*V)); 
        Mr(n,2) = sum(sum(ms.*mr(:,:,2).*f.*V)); 
    end
end