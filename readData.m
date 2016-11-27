function [ tri, x, y, N_elem, N_pts ] = readData( filename )
%READDATA Read the data from given geometry files.
    N_max_search = 100000;
    fid = fopen(filename,'r');
    n_pts = 0;
    tri = [1,1,1];
    x = [];
    y = [];
    N_elem = 0;
    N_pts = 0;
    % Get tri
    fgets(fid);
    while N_elem < N_max_search
        line = fgets(fid);
        data = transpose(sscanf(line,'%f'));
        if size(data,1) == 0
            break
        end
        N_elem = N_elem + 1 ;
        tri(N_elem,:) = data;
    end
    % Get x-y
    fgets(fid);
    while N_pts < N_max_search
        line = fgets(fid);
        data = transpose(sscanf(line,'%f'));
        if size(data,1) == 0
            break
        end
        N_pts = N_pts + 1 ;
        x(N_pts) = data(1);
        y(N_pts) = data(2);
    end
end

