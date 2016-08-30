clear
% Clase omega_1
N(1)=45;
mu(1,:)=[0;0];
sigma1_1=0.5;
sigma2_1=0.5;
rho_1=0;
Sigma(:,:,1)=[sigma1_1^2 rho_1*sigma1_1*sigma2_1;
    rho_1*sigma1_1*sigma2_1 sigma2_1^2];

% Clase omega_2
N(2)=45;
mu(2,:)=[0;0];
sigma1_2=0.5;
sigma2_2=0.5;
rho_2=0;
Sigma(:,:,2)=[sigma1_2^2 rho_2*sigma1_2*sigma2_2;
    rho_2*sigma1_2*sigma2_2 sigma2_2^2];

% Clase omega_3
N(3)=45;
mu(3,:)=[0.7;0.7];
sigma1_3=0.5;
sigma2_3=0.5;
rho_3=0;
Sigma(:,:,3)=[sigma1_3^2 rho_3*sigma1_3*sigma2_3;
    rho_3*sigma1_3*sigma2_3 sigma2_3^2];

% Clase omega_4
N(4)=45;
mu(4,:)=[2;2];
sigma1_4=0.5;
sigma2_4=0.5;
rho_4=0;
Sigma(:,:,4)=[sigma1_4^2 rho_4*sigma1_4*sigma2_4;
    rho_4*sigma1_4*sigma2_4 sigma2_4^2];



X(:,:,1) = mvnrnd(mu(1,:),Sigma(:,:,1), N(1));
%X(:,:,2) = mvnrnd(mu(2,:),Sigma(:,:,2), N(2));
X(:,:,2) = mvnrnd(mu(3,:),Sigma(:,:,3), N(3));
%X(:,:,2) = mvnrnd(mu(4,:),Sigma(:,:,4), N(4));


ej1(X)


