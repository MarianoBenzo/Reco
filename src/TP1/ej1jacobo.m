figure(4);
xlabel('x1'); ylabel('x2'); zlabel('Probability Density');

im=imread('phantom.png'); % leer imagen con el nombre y tipo de formato
grises = rgb2gray(im);

imcrop(im)
mu_verdec = im(1:1,1:1,1:2);


xlabel('x1'); ylabel('x2'); zlabel('Probability Density');
%mu1=[-1 1];
%mu2=[1 1.5];
x1 = -3:.2:3; x2 = -3:.2:3; x3 = -3:.2:3;
[X1,X2, X3] = meshgrid(x1,x2,x3);
Sigma1 = [.25 .3 .2; .3 1 .2; .3 .2 .2];
%Sigma2 = [.5 .4; .4 1];
mu = [1 2 3];
F1 = mvnpdf([X1(:) X2(:) X3(:)],mu,Sigma1);


%gray = rgb2gray(im);
%imshow(gray);

%valor = rgb2hex([10 10 10]);
%colores = rgb2hex(im);

%imshow(imagen);    %muestra la imagen

%rec=imcrop(im, [10 10 10 0]);   %selecciona con el mouse la region a recortar

%row = im(1:1, 1:1, :);
%imshow(row) % muestra la imagen recortada
%cmap = colormap(row);
%m_verde = mean(row);
%
%fila = row(im, R);
%
%mu1=[-1 2];
%mu2=[-1 -2];
%x1 = -10:.2:10; x2 = -10:.2:10;
%[X1,X2] = meshgrid(x1,x2)
%Sigma1 = [.5 0; 0 1];
%Sigma2 = [1 0; 0 .5];
%F1 = mvnpdf([X1(:) X2(:)],mu1,Sigma1);
%F2 = mvnpdf([X1(:) X2(:)],mu2,Sigma2);
%F1 = reshape(F1,length(x2),length(x1));
%F2 = reshape(F2,length(x2),length(x1));
%
%F=F1+F2;
%caxis([min(F(:))-.5*range(F(:)),max(F(:))]);
%axis([-10 10 -10 10 0 .4])
%xlabel('x1'); ylabel('x2'); zlabel('Probability Density');
%size(F1)
%size(F2)
%find(F1>F2);
%m=ones(size(F1),size(F2))
%size(m)
%m(find(F1>F2))=0.0;
%surf(x1,x2,F1+F2, m);