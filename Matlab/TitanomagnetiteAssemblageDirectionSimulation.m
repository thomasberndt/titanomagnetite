

SetupConstants;
ScenariosGrainDistribution;
ScenariosMs; 

ScenariosOneComponent; 
%ScenariosTwoTRMComponents;
ScenariosTwoVRMComponents;

% Scenarios_OneTRM_Stepwise;
%Scenarios_TwoTRM_Stepwise;
Scenarios_TwoVRM_Stepwise;

% Scenarios_OneTRM_AF;
%Scenarios_TwoTRM_AF;
Scenarios_TwoVRM_AF;



%%

for n = 1:length(f)
%     for k = 1:length(m_trm_twocomp)
%         figure(1);
%         clf
%         
%         Ms0 = 480e3 * (Tc-173)/680;     
%         PlotMrDistribution(m_trm_twocomp{k}(:,:,1).*V.*f{n}.*Ms0, V, Tc);
%         saveas(gcf, sprintf('..\\Output\\MagnetizationX\\MagnetizationX f%02d_TwoTRM%02d.png', n, k)); 
%         clf
%         PlotMrDistribution(m_trm_twocomp{k}(:,:,2).*V.*f{n}.*Ms0, V, Tc);
%         saveas(gcf, sprintf('..\\Output\\MagnetizationY\\MagnetizationY f%02d_TwoTRM%02d.png', n, k));   
%     end
    for k = 1:length(m_vrm_twocomp)
        figure(1);
        clf
        
        Ms0 = 480e3 * (Tc-173)/680;     
        PlotMrDistribution(m_vrm_twocomp{k}(:,:,1).*V.*f{n}.*Ms0, V, Tc);
        saveas(gcf, sprintf('..\\Output\\MagnetizationX\\MagnetizationX f%02d_TwoVRM%02d.png', n, k)); 
        clf
        PlotMrDistribution(m_vrm_twocomp{k}(:,:,2).*V.*f{n}.*Ms0, V, Tc);
        saveas(gcf, sprintf('..\\Output\\MagnetizationY\\MagnetizationY f%02d_TwoVRM%02d.png', n, k));   
    end
end





%%


% for n = 11:length(f)
%     for k = 1:length(m_trm_twocomp)
%         figure(1);
%         clf
%         
%         Ms0 = 480e3 * (Tc-173)/680;     
%         PlotMrDistribution(m_trm_twocomp{k}(:,:,1).*V.*f{n}.*Ms0, V, Tc);
%         hold on;
%         T = (0:100:400)+ 273;
%         for m = 1:length(T)
%             [vli, Tcli] = DrawActivationLine(T(m), 100000*yr, tau0, shape, 'r-'); 
%             fli = find(vli == max(vli), 1, 'first'); 
%             text(vli(end), Tcli(end)-273, num2str(T(m)-273), 'Color','red');
%             text(vli(fli), Tcli(fli)-273, num2str(T(m)-273), 'Color','red');
%         end
%         saveas(gcf, sprintf('..\\Output\\MagnetizationX Lines\\MagnetizationX f%02d_TwoTRM%02d.png', n, k)); 
%        
%         clf
%         PlotMrDistribution(m_trm_twocomp{k}(:,:,2).*V.*f{n}.*Ms0, V, Tc);
%         hold on;
%         T = (0:100:400)+ 273;
%         for m = 1:length(T)
%             [vli, Tcli] = DrawActivationLine(T(m), 100000*yr, tau0, shape, 'r-'); 
%             fli = find(vli == max(vli), 1, 'first'); 
%             text(vli(end), Tcli(end)-273, num2str(T(m)-273), 'Color','red');
%             text(vli(fli), Tcli(fli)-273, num2str(T(m)-273), 'Color','red');
%         end
%         saveas(gcf, sprintf('..\\Output\\MagnetizationY Lines\\MagnetizationY f%02d_TwoTRM%02d.png', n, k));   
%     end
% end
%     
    
    
    
%%


for n = 1:length(f)
    for k = 1:length(m_vrm_twocomp)
        figure(1);
        clf
        
        Ms0 = 480e3 * (Tc-173)/680;     
        PlotMrDistribution(m_vrm_twocomp{k}(:,:,1).*V.*f{n}.*Ms0, V, Tc);
        hold on;
        T = (0:100:400)+ 273;
        for m = 1:length(T)
            [vli, Tcli] = DrawActivationLine(T(m), 3600, tau0, shape, 'r-'); 
            fli = find(vli == max(vli), 1, 'first'); 
            text(vli(end), Tcli(end)-273, num2str(T(m)-273), 'Color','red');
            text(vli(fli), Tcli(fli)-273, num2str(T(m)-273), 'Color','red');
        end
        saveas(gcf, sprintf('..\\Output\\MagnetizationX 1h Lines\\MagnetizationX f%02d_TwoVRM%02d.png', n, k)); 
       
        clf
        PlotMrDistribution(m_vrm_twocomp{k}(:,:,2).*V.*f{n}.*Ms0, V, Tc);
        hold on;
        T = (0:100:400)+ 273;
        for m = 1:length(T)
            [vli, Tcli] = DrawActivationLine(T(m), 3600, tau0, shape, 'r-'); 
            fli = find(vli == max(vli), 1, 'first'); 
            text(vli(end), Tcli(end)-273, num2str(T(m)-273), 'Color','red');
            text(vli(fli), Tcli(fli)-273, num2str(T(m)-273), 'Color','red');
        end
        saveas(gcf, sprintf('..\\Output\\MagnetizationY 1h Lines\\MagnetizationY f%02d_TwoVRM%02d.png', n, k));   
    end
end
    
    
    
    
    
%%


% for n = 11:11
%     for k = 1:length(m_trm_twocomp)
%         figure(1);
%         clf
%         
%         Ms0 = 480e3 * (Tc-173)/680;     
%         PlotMrDistribution(m_trm_twocomp{k}(:,:,1).*V.*f{n}.*Ms0, V, Tc);
%         hold on;
%         Htilde = [0 10 30 60 100 150 200 230] * 1e-3; 
%         for m = 1:length(Htilde)
%                         
%             [vli, Tcli] = DrawAfActivationLine(Htilde(m), 273, 50, tau0, shape, 'r-'); 
%             fli = find(vli == max(vli), 1, 'first'); 
%             text(vli(end), Tcli(end)-273, num2str(Htilde(m)*1e3), 'Color','red');
%             text(vli(fli), Tcli(fli)-273, num2str(Htilde(m)*1e3), 'Color','red');
%         end
%         saveas(gcf, sprintf('..\\Output\\MagnetizationX AF Lines\\MagnetizationX f%02d_TwoTRM%02d.png', n, k)); 
%        
%         clf
%         PlotMrDistribution(m_trm_twocomp{k}(:,:,2).*V.*f{n}.*Ms0, V, Tc);
%         hold on;
%         Htilde = [0 10 30 60 100 150 200 230] * 1e-3; 
%         for m = 1:length(Htilde)
%                         
%             [vli, Tcli] = DrawAfActivationLine(Htilde(m), 273, 50, tau0, shape, 'r-'); 
%             fli = find(vli == max(vli), 1, 'first'); 
%             text(vli(end), Tcli(end)-273, num2str(Htilde(m)*1e3), 'Color','red');
%             text(vli(fli), Tcli(fli)-273, num2str(Htilde(m)*1e3), 'Color','red');
%         end
%         saveas(gcf, sprintf('..\\Output\\MagnetizationY AF Lines\\MagnetizationY f%02d_TwoTRM%02d.png', n, k));   
%     end
% end
    
    
    
    
%%
    



Mr_demag = ContinuousDemagnetization(f, m_trm, V, Tc, T, 1000, tau0, shape); 
Mr_demag2 = ContinuousDemagnetization(f, m_trm2, V, Tc, T, 1000, tau0, shape); 
Mr_vrm = ContinuousDemagnetization(f, m_vrm, V, Tc, T, 1000, tau0, shape); 
Mr_vrm2 = ContinuousDemagnetization(f, m_vrm2, V, Tc, T, 1000, tau0, shape); 
Mr_demag_step = StepwiseDemagnetization(f, m_trm, V, Tc, T, 100, tau0, shape); 
Mr_demag2_step = StepwiseDemagnetization(f, m_trm2, V, Tc, T, 100, tau0, shape); 
Mr_vrm_step = StepwiseDemagnetization(f, m_vrm, V, Tc, T, 100, tau0, shape); 
Mr_vrm2_step = StepwiseDemagnetization(f, m_vrm2, V, Tc, T, 100, tau0, shape); 
[Ms, T] = MsCurve(f, V, Tc, 273, 580+273); 

Mr_demag_af = AfDemagnetization(f, m_trm, V, Tc, 273, 50, Htilde, tau0, shape); 
Mr_demag2_af = AfDemagnetization(f, m_trm2, V, Tc, 273, 50, Htilde, tau0, shape); 
Mr_vrm_af = AfDemagnetization(f, m_vrm, V, Tc, 273, 50, Htilde, tau0, shape); 
Mr_vrm2_af = AfDemagnetization(f, m_vrm2, V, Tc, 273, 50, Htilde, tau0, shape); 



figure(2);
PlotSample(Mr_demag, Mr_demag_step, Mr_demag_af, Htilde, m_trm, T, V, Tc, f, Ms);

figure(3);
PlotSample(Mr_demag2, Mr_demag2_step, Mr_demag2_af, Htilde, m_trm2, T, V, Tc, f, Ms); 

figure(4);
PlotSample(Mr_vrm, Mr_vrm_step, Mr_vrm_af, Htilde, m_vrm, T, V, Tc, f, Ms); 

figure(5);
PlotSample(Mr_vrm2, Mr_vrm2_step, Mr_vrm2_af, Htilde, m_vrm2, T, V, Tc, f, Ms); 

