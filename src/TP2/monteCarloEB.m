function [ mu_est ] = monteCarloEB(n, N, mu_0, sigma_0, sigma)

mu_est = zeros([N n]) % mu's generados en cada experimento dentro del MC
size(mu_est)

for j=1:N % repetir N veces para hacer el estudio de Monte Carlo.
    [ mu_est(j,:) ] = estimadorBayesiano( n, mu_0, sigma_0, sigma )
end

end
