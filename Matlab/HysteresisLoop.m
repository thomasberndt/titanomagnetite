function [H, M] = HysteresisLoop(f, V, Tc, T, total_time, tau0, shape, maxH)
    if nargin < 8
        maxH = 0.3; 
    end 
    
    steps = 200; 
    Hinit = linspace( 0, maxH, steps/2);
    H1 = linspace( maxH, -maxH, steps);
    H2 = linspace(-maxH,  maxH, steps);
    H = [Hinit, H1, H2]; 
    
    t = total_time / length(H); 
    M = zeros(size(H)); 
    m = zeros(size(f)); 
    
    for n = 1:length(H)
        m = AcquireHysteresis(m, V, Tc, T, t, H(n), tau0, shape);
        M(n) = MeasureNRM(m, Tc, f, V); 
        
    end
end