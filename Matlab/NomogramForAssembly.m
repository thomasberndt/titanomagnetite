
    ho = ishold(); 

    N = 1;
    k_B = 1.38e-23;
    mu0 = 4*pi*1e-7;
    yr = 365.25*24*3600;
    tau0 = 1e-9; 
    Ms0 = 480e3; 
    
    [V,Tc] = meshgrid(logspace(log10(9e-9^3), log10(50e-9^3),1e5), linspace(280+273,580+273,10)); 
    f = ones(size(V));
    %f(:,end) = 1; 
    f = f./sum(f(:)); 
    [T,t ] = meshgrid(linspace(273, 580+273), logspace(log10(1), log10(1000*yr))); 
    block = zeros(size(T));
    
    for n = 1:length(t(:,1))
        disp(n/length(t(:,1)));
        for k = 1:length(T(1,:))
            V_B = 2*k_B*log(t(n,k)/tau0) ./ ( mu0*N*Ms0^2*( 1./T(n,k) - 1./Tc(:,1) ));
            V_B(V_B<0) = Inf;
            vv(n,k) = V_B(1); 
            for m = 1:length(Tc(:,1))
                block(n,k) = block(n,k) + sum(f(m,V(m,:)<V_B(m)));
            end
        end
    end
    
    contour(T-273,t,block,100); 
    
    
    
    set(gca,'YTick',[1,60,3600,24*3600, 30*24*3600, ...
            yr,10*yr, 100*yr, 1000*yr, 1e4*yr, 1e5*yr, 1e6*yr, ...
            1e9*yr, 1e12*yr]);
    set(gca,'YTickLabel',{'1 s', '1 min', '1 h', '1 day', '1 m', ...
            '1 yr', '10 yr', '100 yr', ...
            '1 ka', '10 ka', '100 ka', ...
            '1 Ma', '1 Ba', '1 Ta'});

    grid on
    axis([0,max(max(Tc(:)-273),100),1,1000*yr]);
    set(gca,'yscale','log')

    xlabel('Blocking Temperature T_B [C]'); 
    ylabel('Relaxation time t [s]'); 
    
    if ho
        hold on
    else
        hold off
    end