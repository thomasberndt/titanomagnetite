function [h1, h2] = Zijderveld(M, T, Tlabels, line_h, line_v, noscaling)
    if nargin < 3
        Tlabels = T;
    end
    if nargin < 4
        line_h = '-k'; 
    end
    if nargin < 5
        line_h = '-k'; 
        line_v = '-g'; 
    end
    if nargin < 6
        noscaling = 0;
    end
    h = ishold(); 
    h1 = plot(M(:,2), M(:,1), line_h);
    h1.MarkerFaceColor = 'w'; 
    h2 = [];
    hold on 
    if (length(M(1,:)) == 3)
        if ~isempty(strfind(line_v, 'grey'))
            h2 = plot(M(:,2), M(:,3), strrep(line_v, 'grey', ''), 'Color', 0.7 * [1 1 1]);
        else
            h2 = plot(M(:,2), M(:,3), line_v);
        end
    end
    
    if ~noscaling
        a = gca; 
        a.XTick = [];
        a.YTick = []; 
        a.XColor = 'w';
        a.YColor = 'w';
        grid off
        left = min(M(:,2));
        right = max(M(:,2)); 
        if size(M,2) < 3
            top = max(M(:,1));
            bottom = min(M(:,1)); 
        else
            top = max(max(M(:,1)), max(M(:,3))); 
            bottom = min(min(M(:,1)), min(M(:,3))); 
        end
        if top<-0.1*bottom
            top=-0.1*bottom;
        end
        if bottom>-0.1*top
            bottom=-0.1*top;
        end
        if left>-0.1*right
            left=-0.1*right;
        end
        if right<-0.1*left
            right=-0.1*left;
        end
        height = top - bottom; 
        width = right - left; 
        midX = (right+left) / 2; 
        midY = (top+bottom) / 2; 
        siz = max(height, width)*1.1; 
        left   = midX - siz/2; 
        right  = midX + siz/2;
        bottom = midY - siz/2;
        top    = midY + siz/2;
        mag = 1.05;
        left2   = midX - mag*siz/2; 
        right2  = midX + mag*siz/2;
        bottom2 = midY - mag*siz/2;
        top2   = midY + mag*siz/2;
        axis([left2, right2, bottom2, top2]);
        
        siz = abs(right-left);
        ste = 0; siz*0.02;
        plot([left right], [0 0], 'k-');
        plot([0 0], [bottom top], 'k-');
        
%         if (length(M(1,:)) == 3)
%             text(0, top+ste, sprintf('North (black)\n / Up (grey)'), 'HorizontalAlignment', 'Center', 'VerticalAlignment', 'Bottom'); 
%             text(0, bottom-ste, sprintf('South (black)\n / Down (grey)'), 'HorizontalAlignment', 'Center', 'VerticalAlignment', 'Top'); 
%         else
%             text(0, top+ste, sprintf('N'), 'HorizontalAlignment', 'Center', 'VerticalAlignment', 'Bottom', 'FontSize', 14); 
%             text(0, bottom-ste, sprintf('S'), 'HorizontalAlignment', 'Center', 'VerticalAlignment', 'Top', 'FontSize', 14); 
%         end
%         text(left-ste, 0, 'W', 'HorizontalAlignment', 'Right', 'VerticalAlignment', 'Middle', 'FontSize', 14);
%         text(right+ste, 0, 'E', 'HorizontalAlignment', 'Left', 'VerticalAlignment', 'Middle', 'FontSize', 14); 
    end
    
    
    idx = zeros(size(T));
    for n = 1:length(Tlabels)
        idx(find(T>=Tlabels(n), 1, 'first')) = 1; 
    end
    idx = logical(idx); 
    h1 = plot(M(idx,2), M(idx,1), strrep(line_h, '-','o'));
    h1.MarkerFaceColor = 'w'; 
    h2 = [];
    hold on 
    if (length(M(1,:)) == 3)
        if ~isempty(strfind(line_v, 'grey'))
            h2 = plot(M(idx,2), M(idx,3), strrep(strrep(line_v, '-','o'), 'grey', ''), 'Color', 0.7 * [1 1 1]);
        else
            h2 = plot(M(idx,2), M(idx,3), strrep(line_v, '-','o'));
        end
    end
    
    
    if h
        hold on
    else 
        hold off
    end
end