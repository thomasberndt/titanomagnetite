function TitanoExperiment(mr, scenario_number, scenario_description, f, V, Tc, shape, tau0)
    mu0 = pi*4e-7; 
    kB = 1.38e-23;
    Ms0 = CalculateMs0(Tc);
    T = 20 + 273; 
    ms = Ms0 .* sqrt(1 - (T./Tc)); 
    ms(T>Tc) = 0; 
    
    f1 = 10; 
    H1 = shape .* ms - sqrt(2.*shape.*kB.*T.*log(1./(2.*f1.*tau0)) ./ (mu0.*V)); 
    f2 = 200; 
    H2 = shape .* ms - sqrt(2.*shape.*kB.*T.*log(1./(2.*f2.*tau0)) ./ (mu0.*V)); 
    
    t1 = 3; 
    t2 = 300; 
    H = linspace(0, 0.1, 51); 
    M1 = zeros(length(H), length(H)); 
    M2 = zeros(length(H), 1); 
    Ms = zeros(length(H), 1); 
    for k = 1:round(length(H)/2)
        disp(H(k) * 1000); 
        for n = k:length(H)

            mr = AcquireVRM(mr, V, Tc, 20+273, 300, [0, 1], tau0, shape);
            mr = AcquireVRM(mr, V, Tc, 20+273, 1, [0, 0], tau0, shape);
            m = MeasureNRM(mr, Tc, f, V); 
            Ms(k) = m(2); 
            mr = AcquireVRM(mr, V, Tc, 20+273, t2, [0, -H(k)], tau0, shape);
            mr = AcquireVRM(mr, V, Tc, 20+273, 1, [0, 0], tau0, shape);
            m = MeasureNRM(mr, Tc, f, V); 
            M2(k) = m(2); 
        
            mr = AcquireVRM(mr, V, Tc, 20+273, t1, [0, H(n)], tau0, shape);
            mr = AcquireVRM(mr, V, Tc, 20+273, 1, [0, 0], tau0, shape);
            m = MeasureNRM(mr, Tc, f, V); 
            M1(k, n) = m(2); 
        end
    end
    
    figure(3);
    [H1, H2] = meshgrid(H, H); 
    contourf(H1*1000, H2*1000, M1);     
    colormap(flipud(colormap('gray')));
    %colorbar
    xlabel('H(f=3s) [mT]'); 
    ylabel('H(f=300s) [mT]'); 
    title('M1'); 
    %set(gca,'xscale','log')
    %xlim([1e1 1e2])
    %ax = gca; 
    %ax.XAxis.TickValues = 10:10:100;
    axis([0 50 0 50]);
    
    M1 = M1-Ms(1);
    x = diff(diff(M1,1,1),1,2); 
    xp = x; 
    xn = x; 
    xp(xp < 0) = 0;
    xn(xn > 0) = 0; 
    
    figure(4);
    [H1, H2] = meshgrid(H(1:end-1), H(1:end-1)); 
    contourf(H2*1000, (H1-H2)*1000, log10(xp));
    xlabel('H(f=300s) [mT]'); 
    ylabel('H(f=3s)-H(f=300s) [mT]'); 
    title('M2'); 
    axis([0 50 0 50]);
    
    
    
    save('temp');
end

