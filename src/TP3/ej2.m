mu = [2,3];
sigma = [1,1.5;1.5,3];
rng default  % For reproducibility
F1 = mvnpdf(mu, sigma);
r = mvnrnd(mu,sigma,1000);

mu1 = [5,10];
sigma1 = [2.5,1.0;1.0,2];
rng default  % For reproducibility
F2 = mvnpdf(mu1, sigma1);
r1 = mvnrnd(mu1,sigma1,1000);

figure(1)
hold on;
plot(r(:,1),r(:,2),'b*')
plot(r1(:,1),r1(:,2),'r*')
hold off;

x = -5:.5:10; %// x axis
y = -5:.5:15; %// y axis

[X Y] = meshgrid(x,y); %// all combinations of x, y
Z1 = mvnpdf([X(:) Y(:)],mu,sigma); %// compute Gaussian pdf
Z1 = reshape(Z1,size(X)); %// put into same size as X, Y
Z2 = mvnpdf([X(:) Y(:)],mu1,sigma1); %// compute Gaussian pdf
Z2 = reshape(Z2,size(X)); %// put into same size as X, Y
%// contour(X,Y,Z), axis equal  %// contour plot; set same scale for x and y...
figure(2)
hold on;
surf(X,Y,Z1) %// ... or 3D plot
surf(X,Y,Z2)
hold off;

x1 = -2
x2 = 12
width = x2-x1
y1 = -4
y2 = 16
height = y2 - y1
matrix = zeros([width height])
N = 10000

for i=0:width-1
    for j=0:height-1
        x_ij = [x1+i, y1+j]
        if (parzenr2(x_ij, r, N) > parzenr2(x_ij, r1, N))
            matrix[i,j] = 1
        end
    end
end



