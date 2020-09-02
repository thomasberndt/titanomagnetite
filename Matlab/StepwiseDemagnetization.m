function Mr = StepwiseDemagnetization(f, mr, V, Tc, T, t, tau0, shape)
    Mr = zeros(length(T), 2);     
    Ms0 = CalculateMs0(Tc);
    mr_out = mr; 
    for n = 1:length(T)
        mr_out = AcquireVRM(mr_out, V, Tc, T(n), t, [0, 0], tau0, shape); 
        Mr(n,1) = sum(sum(Ms0.*mr_out(:,:,1).*f.*V)); 
        Mr(n,2) = sum(sum(Ms0.*mr_out(:,:,2).*f.*V)); 
    end
end