function [ fig ] = plotGridEig( tri, x, y, EigVec, EigVal, n)
%PLOTGRID Plot all elements of a triangularization
% Points are given by X and Y coordinates and the elements by tri.
% Eigenvector Matrix is given by EigVec and Figures are plotted for the n
% first eigenvalues.
    for i = 1:n
        fig = figure();
        daspect([1 1 1]);
        Vec = EigVec(:,i);
        fill( x(tri).', y(tri).', Vec(tri).' );
        title(sprintf('%s%f','\lambda = ',EigVal(i)));
        xlabel('x-Richtung');
        ylabel('y-Richtung');
        colorbar
    end
end

