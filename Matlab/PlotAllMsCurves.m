

load('..\\Temp\\Ms 046.mat'); % Bimodal
Ms1 = MsCurve(f, V, Tc, T); 
load('..\\Temp\\Ms 054.mat'); % Continuous
Ms2 = MsCurve(f, V, Tc, T); 
load('..\\Temp\\Ms 102.mat'); % Broad
Ms3 = MsCurve(f, V, Tc, T); 

Ms1n = 0.95*Ms1/Ms1(1);
Ms2n = 0.75*Ms2/Ms2(1);
Ms3n = 0.85*Ms3/Ms3(1);

fh = figure(1); 
set(fh, 'Position', [100, 100, 500, 500]);
clf

h = plot(T-273, Ms1n, 'k-', ...
         T-273, Ms2n, 'k-', ...
         T-273, Ms3n, 'k-'); 
xlabel('T [°C]'); 
ylabel('M_s(T) [arbitrary units]'); 
grid off
hold on

a = gca; 
a.XTick = 0:100:600;
a.YTick = [0];
a.XLim = [-100 600];

text(min(T)-273, Ms1n(1), 'Bimodal', 'HorizontalAlignment', 'Right', 'VerticalAlignment', 'Middle');
text(min(T)-273, Ms2n(1), 'Continuous', 'HorizontalAlignment', 'Right', 'VerticalAlignment', 'Middle');
text(min(T)-273, Ms3n(1), 'Broad', 'HorizontalAlignment', 'Right', 'VerticalAlignment', 'Middle');



hold on 


f = fit(T', Ms1n,  'smoothingspline', 'SmoothingParam', 1e-5);
[~, M1] = differentiate(f, T);
[~,pks] = findpeaks(M1);
if ~isempty(pks)
    pk = pks(1);
    text(T(pk)-273, Ms1n(pk)+0.17, sprintf('T_{C,TM60}=%d°C', round(T(pk))-273), 'HorizontalAlignment', 'Center', 'VerticalAlignment', 'Bottom');
    plot([T(pks(n)), T(pks(n))]-273, [Ms1n(pk)-0.0, Ms1n(pk)+0.17], 'Color', [0.6,0.6,0.6]); 
end
        




