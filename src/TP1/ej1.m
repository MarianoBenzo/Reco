figure(4);
xlabel('x1'); ylabel('x2'); zlabel('Probability Density');
mu1=[-1 1];
mu2=[1 1.5];
x1 = -3:.2:3; x2 = -3:.2:3;
[X1,X2] = meshgrid(x1,x2);
Sigma1 = [.25 .3; .3 1];
Sigma2 = [.5 .4; .4 1];
F1 = mvnpdf([X1(:) X2(:)],mu1,Sigma1);
F2 = mvnpdf([X1(:) X2(:)],mu2,Sigma2);
F1 = reshape(F1,length(x2),length(x1));
F2 = reshape(F2,length(x2),length(x1));
surf(x1,x2,F1+F2);
F=F1+F2;
caxis([min(F(:))-.5*range(F(:)),max(F(:))]);
axis([-3 3 -3 3 0 .4])
xlabel('x1'); ylabel('x2'); zlabel('Probability Density');
size(F1)
size(F2)
find(F1>F2);
m=ones(31,31)
size(m)
m(find(F1>F2))=0.0;
figure, imshow(m);