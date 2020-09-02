function [T, M, t, descr] = LoadRussian(filename, description, instrumentCoordinates)
    if nargin < 2
        description = NaN; 
    end
    if nargin < 3
        instrumentCoordinates = 0; 
    end
    fileID = fopen(filename);
    C = textscan(fileID,'%f %f %f %f %f');
    if ~isempty(C{1}) && isempty(C{5})
        fclose(fileID);
        fileID = fopen(filename);
        C = textscan(fileID,'%f %f %f %f %s');
        C{5} = ones(size(C{1}));
    end
    clear M;
    if ~isempty(C{1})
        if isnan(C{5}(1))
            % Spinner format
            T = C{1};
            M(:,1) = C{2};
            M(:,2) = C{3}; 
            M(:,3) = zeros(size(C{2}));  
            t = [1:length(T)]'; 
            descr = C{4};
        else
            % Imperial format
            T = C{1};
            if ~instrumentCoordinates
                M(:,1) = C{4}; 
                M(:,2) = -C{3}; 
                M(:,3) = -C{2}; 
            else
                M(:,1) = C{2}; 
                M(:,2) = C{3}; 
                M(:,3) = C{4}; 
            end
            descr = C{5}; 
            t = [1:length(T)]'; 
        end
    else 
        % Borok format
        C = textscan(fileID,'%f %f %f %f %f %f', 'HeaderLines', 10);
        T = C{1};
        if ~instrumentCoordinates
            M(:,1) = C{4}; 
            M(:,2) = -C{3}; 
            M(:,3) = C{2}; 
        else
            M(:,1) = C{2}; 
            M(:,2) = C{3}; 
            M(:,3) = C{4}; 
        end
        descr = C{5};
        t = C{6}; 
        if isnan(t(1))
            t = [1:length(T)]'; 
        end
    end
    fclose(fileID);
    
    if ~isnan(description)
        idx = logical(descr==description);
        T = T(idx);
        M = M(idx,:); 
        t = t(idx);
    end
end
