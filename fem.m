%% Loesungen der Rechtecke mit FEM Ergebnissen vergleichen

R_klein_EW = fem_solve_grid('Finite_Elemente/RechteckPi_200.asc',1);
R_gross_EW = fem_solve_grid('Finite_Elemente/RechteckPi_1054.asc',1);

ana_EW = [0;-1;-1;-2;-4;-4;-5;-5;-8];

%% Plot EWs


fig = figure();
hold on;
plot(abs(ana_EW(2:9)),abs(R_klein_EW(2:9)-ana_EW(2:9))./abs(ana_EW(2:9)));
plot(abs(ana_EW(2:9)),abs(R_gross_EW(2:9)-ana_EW(2:9))./abs(ana_EW(2:9)))
hold off;
legend('R200','R1054')
grid on
xlabel('\lambda_{ana}')
ylabel('\Delta')

%% Trommel Spektren berechnen
EW_Trommel_A = fem_solve_grid('Finite_Elemente/TrommelA_319.asc',1);
EW_Trommel_B = fem_solve_grid('Finite_Elemente/TrommelB_321.asc',1);

%% Plot EW
delta_rel = abs(EW_Trommel_A-EW_Trommel_B)./abs(EW_Trommel_A)

fig = figure();
hold on;
plot(abs(EW_Trommel_A(2:9)),delta_rel(2:9));
hold off;
grid on
xlabel('|\lambda_A|')
ylabel('\Delta')
