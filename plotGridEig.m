function [ fig ] = plotGridEig( tri, x, y, EigVec, EigVal)
%PLOTGRID Plot all elements of a triangularization
% Points are given by X and Y coordinates and the elements by tri.
% Eigenvector Matrix is given by EigVec and Figures are plotted for the 9
% first eigenvalues.
    fig = figure();
    daspect([1 1 1]);
    for i = 1:9
        subplot(3,3,i);
        Vec = EigVec(:,i);
        h = fill( x(tri).', y(tri).', Vec(tri).' );
        title(sprintf('%s%0.3f','\lambda = ',EigVal(i)));
        xlabel('x-Richtung');
        ylabel('y-Richtung');
        cb=colorbar;
        set(cb,'yticklabel',num2str(str2double(get(cb,'yticklabel')),'%0.2f'))
        colormap('jet');
        set(h,'EdgeColor','None');
        axis([-inf inf -inf inf])
    end
    set(fig,'PaperSize',[9 6]);
end

