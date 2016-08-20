mu0 = 3;
sigma0 = 0.5;
sigma=3;
n=10000;

[ mu_n, sigma_n, x_n ] = estimadorBayesiano(n, mu0, sigma0, sigma)

% Display de la evolucion de las pdf's resultantes de las estimaciones.
figure(1);
x=0:0.1:5;
col=[0 0 0; 0 0 1; 0 1 0; 1 0 0; 0 1 1 ; 1 0 1; 1 1 0];
c=0;
plot(x,normpdf(x,mu0,sigma0),'Color',col(c+1,:));
hold on
for i=[10,100,500,1000]
    c=c+1;
    plot(x,normpdf(x,mu_n(i),sigma_n(i)),'Color',col(mod(c,7)+1,:));
    disp(i),disp(mu_n(i)),disp(sigma_n(i));
end

legend('p(mu)', 'n=10', 'n=100', 'n=500', 'n=1000');
hold off

% Display de la evolucion de los mu_n y x_n
figure(2);
hold on
plot(mu_n(1:100),'r');
plot(x_n(1:100),'b');
legend('mu_n','x_n');
hold off

hist(mu_n, 100)