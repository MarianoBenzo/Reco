clear

%%%%%%%%%%%%%%%%%%%%%
% Clase omega_1
N(1)=45;
mu(1,:)=[0;0;0];
sigma1_1=0.5;
sigma2_1=0.5;
sigma3_1=0.5;
rho_1=0;
Sigma(:,:,1)=[sigma1_1^2 rho_1*sigma3_1*sigma2_1*sigma1_1 rho_1*sigma3_1*sigma2_1*sigma1_1;
     rho_1*sigma3_1*sigma2_1*sigma1_1 sigma2_1^2 rho_1*sigma3_1*sigma2_1*sigma1_1;
    rho_1*sigma3_1*sigma2_1*sigma1_1 rho_1*sigma3_1*sigma2_1*sigma1_1 sigma3_1^2];


% Clase omega_2
N(2)=45;
mu(2,:)=[2;2;2];
sigma1_2=0.5;
sigma2_2=0.5;
sigma3_2=0.5;
rho_2=0;
Sigma(:,:,2)=[sigma1_2^2 rho_2*sigma3_2*sigma2_2*sigma1_2 rho_2*sigma3_2*sigma2_2*sigma1_2;
     rho_2*sigma3_2*sigma2_2*sigma1_2 sigma2_2^2 rho_2*sigma3_2*sigma2_2*sigma1_2;
   rho_2*sigma3_2*sigma2_2*sigma1_2 rho_2*sigma3_2*sigma2_2*sigma1_2 sigma3_2^2];

% Clase omega_3
N(3)=45;
mu(3,:)=[1;4;4];
sigma1_3=0.5;
sigma2_3=0.5;
sigma3_3=0.5;
rho_3=0;
Sigma(:,:,3)=[sigma1_3^2 rho_3*sigma3_3*sigma2_3*sigma1_3 rho_3*sigma3_3*sigma2_3*sigma1_3;
    rho_3*sigma3_3*sigma2_3*sigma1_3 sigma2_3^2 rho_3*sigma3_3*sigma2_3*sigma1_3;
   rho_3*sigma3_3*sigma2_3*sigma1_3 rho_3*sigma3_3*sigma2_3*sigma1_3 sigma3_3^2];
%%%%%%%%%%%%%%%%%%%%%

f1 = figure();


% x_1 (Puntos Rojos)
x_1 = mvnrnd(mu(1,:),Sigma(:,:,1), N(1));

% x_2 (Puntos Azules)
x_2 = mvnrnd(mu(2,:),Sigma(:,:,2), N(2));

% x_3 (Puntos Verdes)
x_3 = mvnrnd(mu(3,:),Sigma(:,:,3), N(3));

%Combinamos todos los datos en una sola matriz
x=[x_1; x_2; x_3];

plot3(x_1(:,1),x_1(:,2),x_1(:,3),'r*')
hold on
plot3(x_2(:,1),x_2(:,2),x_2(:,3),'b*')
hold on
plot3(x_3(:,1),x_3(:,2),x_3(:,3),'g*')



grid on
xlabel('X');
ylabel('Y');
zlabel('Z');


% Generamos y:
% label '1' para la clase 1
% label '2' para la clase 2
% label '3' para la clase 3

%y=[1,1,[...],1,1,2,2,[...],2,2,3,3,[...],3,3];
y=[1*ones(1,N(1)) 2*ones(1,N(2)) 3*ones(1,N(3))];

X=x';
Y=y;
r=2;
% Reducimos dimensión a 2D
[Z,W] = ej2(X,Y',r)

f2 = figure();
plot(Z(1,Y==1),Z(2,Y==1),'r*')
hold on
plot(Z(1,Y==2),Z(2,Y==2),'b*')
hold on
plot(Z(1,Y==3),Z(2,Y==3),'g*')


X=x';
Y=y;
r=1;

% Reducimos dimensión a 1D
[Z,W] = ej2(X,Y',r)
f2 = figure();
plot(Z(Y==1),0,'r*')
hold on
plot(Z(Y==2),0,'b*')
hold on
plot(Z(Y==3),0,'g*')
