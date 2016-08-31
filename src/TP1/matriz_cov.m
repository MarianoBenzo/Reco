function [ z ] = matriz_cov( a )

%ESTA FUNCION TOMA COMO DATO DE ENTRADA UNA MATRIZ DE x*y*z (3 dimensiones)
%CALCULA LA MATRIZ DE COVARIANZA DE DICHA MATRIZ

x=reshape(a(:,:,1),numel(a(:,:,1)),1)
y=reshape(a(:,:,2),numel(a(:,:,2)),1)
z=reshape(a(:,:,3),numel(a(:,:,3)),1)

N=numel(x); %(assume equal lengths)
CovXY=(double(x)-double(mean(x)))'*(double(y)-double(mean(y)))/(N-1);
CovYX=CovXY;

CovXZ=(double(x)-double(mean(x)))'*(double(z)-double(mean(z)))/(N-1);
CovZX=CovXZ;
CovYZ=(double(y)-double(mean(y)))'*(double(z)-double(mean(z)))/(N-1);
CovZY=CovYZ;
z=[var(double(x)) CovXY CovXZ; CovYX  var(double(y)) CovYZ; CovZX  CovZY  var(double(z))];


end

