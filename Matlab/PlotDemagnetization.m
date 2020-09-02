function PlotDemagnetization(Mr_cont, Mr_step, T, Ms)

    plot(T-273, Mr_cont, T-273, Mr_step, T-273, Ms/max(Ms)*max(Mr_cont(:))); 
    title('M_r(T)'); 
    xlabel('T [C]'); 
    ylabel('M_r(T)'); 
    grid on
    grid minor
    legend('M_{r,x} cont.', 'M_{r,y} cont.', 'M_{r,x} step', 'M_{r,y} step', 'M_s', 'Location','best'); 
end