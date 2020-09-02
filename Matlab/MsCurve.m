function Ms = MsCurve(f, V, Tc, T)
    Ms = zeros(length(T), 1);     
    Ms0 = CalculateMs0(Tc);
    for n = 1:length(T)
        ms = Ms0 .* sqrt(1 - (T(n)./Tc)); 
        ms(T(n)>Tc) = 0; 
        Ms(n) = gather(sum(sum(ms.*f.*V))); 
    end
end