function [ mu_n, sigma_n, x_n ] = estimadorBayesiano( n, mu0, sigma0, sigma )
mu=randn(1)*sigma0 + mu0;
disp(mu);
D=randn(1,n)*sigma + mu;
mu_n=zeros(1,n);
sigma_n=zeros(1,n);
x_n=zeros(1,n);
w_mu0=zeros(1,n);
w_xn=zeros(1,n);

for i=1:n
    x_n(i)=mean(D(1:i));
    w_xn(i) = (i*sigma0^2/(i*sigma0^2+sigma^2));
    w_mu0(i) = (sigma^2/(i*sigma0^2+sigma^2));
    mu_n(i)=w_xn(i)*x_n(i)+w_mu0(i)*mu0;
    sigma_n(i)=sigma0^2*sigma^2/(i*sigma0^2+sigma^2);
end

end

