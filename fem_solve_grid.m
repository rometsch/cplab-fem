function [EigVals] = fem_solve_grid(filename,plot)
%FEM_SOLVE_GRID Loest das Eigenwertproblem auf der in filename gegebenen
%Geometrie und stellt die Eigenfunctionen zu den kleinsten 9 Eigenwerten
%graphisch dar.
    % Definiere Parameter
    N_eigenvals = 9;
    
    % Gitter laden
    [tri, x, y, N_elem, N_pts] = readData(filename);

    % Graphische Darstellung der Gitter
    % plotGrid(tri,x,y);

    % Berechnung der Matrizen
    n = 1:N_elem;
    g = ( x(tri(n,2)) - x(tri(n,1)) ).*( y(tri(n,3)) - y(tri(n,1)) ) - ( x(tri(n,3)) - x(tri(n,1)) ).*( y(tri(n,2)) - y(tri(n,1)) );

    d = 1/6*reshape(repmat(g,3,1),1,3*N_elem);
    D = sparse(1:3*N_elem,1:3*N_elem,d);

    K = sparse([],[],[],3*N_elem,3*N_elem,9*N_elem);

    for n = 1:N_elem
       X = [x(tri(n,1:3)); y(tri(n,1:3)); [1,1,1]];
       A = (X)^(-1);
       K_n = zeros(3,3);
       for k = 1:3
           for l = 1:3
               K_n(k,l) = A(k,1)*A(l,1) + A(k,2)*A(l,2);
           end
       end
       ind = n*3-2:n*3;
       K(ind,ind) = -0.5*g(n)*K_n;
    end

    T = sparse(N_pts,3*N_elem);
    for i = 1:N_elem
        for k = 1:3
           T(tri(i,k),3*(i-1)+k) = 1;
        end
    end

    % Berechne die Eigenwerte (und Eigenvektoren)
    [EigVec,EigVal] = eigs(T*K*T.',T*D*T.',N_eigenvals,'sm');

    if (plot==1)
        % Stelle Eigenfunktionen graphisch dar
        plotGridEig(tri,x,y,EigVec,diag(EigVal));
    end
        
    EigVals = diag(EigVal);

    % Eigenwerte augeben
    %disp(diag(EigVal));
end