function PlotAfDemagnetization(Mr_af, Htilde)

    plot(Htilde*1000, Mr_af); 
    title('M_r(H)'); 
    xlabel('H [mT]'); 
    ylabel('M_r(H)'); 
    grid on
    grid minor
    legend('M_{r,x} af.', 'M_{r,y} af.', 'Location','best'); 
end