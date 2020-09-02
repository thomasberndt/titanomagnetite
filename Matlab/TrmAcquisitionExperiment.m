function TrmAcquisitionExperiment(filename)
    smoothing = 1e-2; 
    [T, M, t, descr] = LoadRussian(strcat('..\Input\', filename), NaN, 1);
    
    M = M(:,1); 
    
    cool = logical(or(round(descr/1000)==1,round(descr/1000)==2)); 
    heat = logical(round(descr/1000)==3); 
    d = mod(descr, 1000); 
    
    figure(1)
    clf
    du = unique(d); 
    for n = 1:length(du)        
        id = logical(and(d==du(n),cool)); 
        Msm = SmoothM(M(id), T(id), smoothing); 
        plot(T(id), Msm, 'k-'); 
        hold on
        f = find(id,1,'last');
        text(T(f), Msm(end), num2str(du(n)), 'HorizontalAlignment', 'right'); 
    end
    grid on
    grid minor
    xlabel('Temperature [°C]');
    ylabel('Magnetic moment'); 
    
    figure(2)
    clf
    du = unique(d); 
    for n = 1:length(du)        
        id = logical(and(d==du(n),heat)); 
        Msm = SmoothM(M(id), T(id), smoothing); 
        plot(T(id), Msm, 'k-'); 
        hold on
        f = find(id,1,'first');
        text(T(f), Msm(1), num2str(du(n)), 'HorizontalAlignment', 'right'); 
    end
    grid on
    grid minor
    xlabel('Temperature [°C]');
    ylabel('Magnetic moment'); 
    
end