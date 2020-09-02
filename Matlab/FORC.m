function [M, forc, Hu, Hc] = FORC(f, V, Tc, T, t_a, t_b, tau0, shape)
    global useGpu;

    Hsat = 1;
    Hmax = 0.3; 
    Hmin = -0.3; 
    ha = linspace(Hmin, Hmax, 500); 
    hb = linspace(Hmin, Hmax, 500); 
    [Ha, Hb] = meshgrid(ha, hb); 
    
    if useGpu
        mr = zeros(size(f), 'gpuArray');
    else
        mr = zeros(size(f));
    end
    M = NaN * zeros(size(Ha));
    
    for n = 1:length(ha)        
        mr = AcquireVRM(mr, V, Tc, T ,t_a, Hsat, tau0, shape); 
        disp(ha(n))
        mr = AcquireVRM(mr, V, Tc, T ,t_a, ha(n), tau0, shape); 
        idx = find(hb >= ha(n)); 
        M(idx, n) = PartialHysteresisLoop(mr, f, V, Tc, T, t_b, tau0, shape, hb(idx)); 
    end
    
    %plot(Hb, M, 'k-')
    forc = diff(diff(M, 1, 1), 1, 2)./diff(Ha(1:end-1,:), 1, 2)./diff(Hb(:,1:end-1), 1, 1); 
    %figure(6)
    Hu = (Ha(1:end-1,1:end-1) + Hb(1:end-1,1:end-1)) / 2;  
    Hc = (Hb(1:end-1,1:end-1) - Ha(1:end-1,1:end-1)) / 2; 
    %contourf(Hc, Hu, forc);
end