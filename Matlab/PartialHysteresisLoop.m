function [M, mr] = PartialHysteresisLoop(mr, f, V, Tc, T, t, tau0, shape, H)
        
    M = zeros(size(H)); 
    
    for n = 1:length(H)
        mr = AcquireVRM(mr, V, Tc, T, t, H(n), tau0, shape);
        M(n) = gather(MeasureNRM(mr, Tc, f, V)); 
        
    end
end