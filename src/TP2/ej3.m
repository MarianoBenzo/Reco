%Parametros de la distribucion a-priori de mu.
mu_0=3;
sigma_0=0.5;
%Parametro de desviacion standard de los datos (conocido y fijo).
sigma=3;
%Tamaño de los lotes de datos
n=100;
%Cantidad de veces que se realiza el experimento en el Monte Carlo.
N=100;

[ mu_est ] = monteCarloEMV(n, N, mu_0,sigma)
figure(1)
histogram(mu_est)

[ mu_n ] = estimadorBayesiano(n, mu_0, sigma_0, sigma )
figure(2)
histogram(mu_n)

[ mu_est ] = monteCarloEB(n, N, mu_0, sigma_0, sigma)
figure(3)
histogram( mu_est(:) )