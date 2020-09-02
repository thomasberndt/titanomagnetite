function PlotHysteresis(H, M)

    
    fh = figure(2); 
    set(fh, 'Position', [100, 100, 500, 500]);
    %clf
    
    plot(H*1000, M, 'k-', ...
        H3*1000, dM3, 'k-'); 
    xlabel('H [mT]'); 
    ylabel('M [Am^2]'); 
    
    
end