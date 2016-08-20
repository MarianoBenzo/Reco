% Generacion de datos
N_1=30;
N_2=70;
mu_1=[0.75 0.75]';
mu_2=[-1.5 -1.5]';
sigma_1=1;sigma_2=1;
rho=0.8;
Sigma_1=[sigma_1*sigma_1   rho*sigma_1*sigma_2;
         rho*sigma_1*sigma_2 sigma_2*sigma_2];
Sigma_2=[sigma_1*sigma_1   -rho*sigma_1*sigma_2;
         -rho*sigma_1*sigma_2 sigma_2*sigma_2];
X_1 = mvnrnd(mu_1,Sigma_1,N_1);
X_2 = mvnrnd(mu_2,Sigma_2,N_2);
figure(1);
scatter(X_1(:,1),X_1(:,2));
hold on
scatter(X_2(:,1),X_2(:,2));
hold off

%Inicializacion
pi_1=0.5;
pi_2=0.5;
Sigma_1=eye(2);
Sigma_2=eye(2);
mu_1=[-1 1];
mu_2=[1 -1];
h=plot_gaussian_ellipsoid(mu_1, Sigma_1);
h=plot_gaussian_ellipsoid(mu_2, Sigma_2);
hold off
X=[X_1;X_2];


niter = 0;
Ln = 0;
% (abs(100*(Ln-Lo)/Lo)>ltol)

while (niter<=50),

	[ L, pi_2, mu_1, mu_2, Sigma_1, Sigma_2 ] = EM(X,pi_1,pi_2,mu_1,mu_2,Sigma_1,Sigma_2);

	niter
	niter = niter + 1;

	if (mod(niter, 10) == 0)
		figure();
scatter(X_1(:,1),X_1(:,2));
hold on
scatter(X_2(:,1),X_2(:,2));
hold off
		h=plot_gaussian_ellipsoid(mu_1, Sigma_1);
		h=plot_gaussian_ellipsoid(mu_2, Sigma_2);
	end
end 

figure();
scatter(X_1(:,1),X_1(:,2));
hold on
scatter(X_2(:,1),X_2(:,2));
hold off
	h=plot_gaussian_ellipsoid(mu_1, Sigma_1);
	h=plot_gaussian_ellipsoid(mu_2, Sigma_2);
