function [ fig ] = plotGrid( tri, X, Y )
%PLOTGRID Plot all elements of a triangularization
% Points are given by X and Y coordinates and the elements by tri.
    N_elem = size(tri,1);
    fig = figure();
    daspect([1 1 1]);
    hold on
    for n = 1:N_elem
       fill(X(tri(n,:)),Y(tri(n,:)),''); 
    end
    hold off
end

