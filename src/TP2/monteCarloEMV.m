function [ mu_est ] = monteCarloEMV(n,N,mu,sigma)
D=randn(N,n)*sigma + mu;
mu_est=sum(D,2)/n;
figure(1);
axis([2.7 3.2 0 1]);
hist(mu_est/N,100);
end
