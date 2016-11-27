function [ fig ] = plotGridEig()
%PLOTGRID Plot analytical solution of the squared gemometry.
    i = 0;
    EigValAna = [];
    [X,Y] = meshgrid(linspace(0,pi,1000));
    solAna = {};

    for m = 0:2
        for n = 0:2
            i = i+1;
            EigValAna(i) = -(m^2+n^2);
            solAna{i} = cos(X*m).*cos(Y*n);
        end
    end    
    fig = figure();
    daspect([1 1 1]);
    ind = [1,2,4,5,3,7,8,6,9];
    for i = 1:9
        subplot(3,3,i);
        h = surf(X,Y,solAna{ind(i)});
        title(sprintf('%s%0.3f','\lambda = ',EigValAna(ind(i))));
        xlabel('x-Richtung');
        ylabel('y-Richtung');
        cb=colorbar;
        set(cb,'yticklabel',num2str(str2double(get(cb,'yticklabel')),'%0.2f'))
        colormap('jet');
        set(h,'EdgeColor','None');
        axis([-inf inf -inf inf])
    end    
    fig.PaperUnits = 'inches';
    fig.PaperPosition = [0 0 8 6];
    print('solAna.png','-dpng','-r300')
end

