% Leo la imagen y guardo la matriz en n
n=imread('circular.jpg');


%Con imcrop recorto porciones de tierra para definir 3 clases a partir de
%la media y la matriz de covarianza (EMV)
%a: parcela sin cultivo(tierra); b: cultivo rojo; c: cultivo marron o negro
a=imcrop(n,[13.5100, 892.5100, 254.9800, 473.9800]);
figure(1);
imshow(a);
b=imcrop(n,[424.5100, 496.5100, 119.9800, 122.9800]);
figure(2);
imshow(b);
c=imcrop(n,[323.5100, 720.5100, 117.9800, 105.9800]);
figure(3);
imshow(c);

[q1,w1,e1]=size(a);
[q2,w2,e2]=size(b);
[q3,w3,e3]=size(c);

%Calculo la suma de todos los pixeles en las 3 dimensiones (RGB)
auxA=sum(sum(a));
auxB=sum(sum(b));
auxC=sum(sum(c));

%Creo muA..muC (EMV) a partir de vectores de tres dimensiones
muA=[double(auxA(1))/(q1*w1),double(auxA(2))/(q1*w1),double(auxA(3))/(q1*w1)];
muB=[double(auxB(1))/(q2*w2),double(auxB(2))/(q2*w2),double(auxB(3))/(q2*w2)];
muC=[double(auxC(1))/(q3*w3),double(auxC(2))/(q3*w3),double(auxC(3))/(q3*w3)];

%Cree una funcion auxiliar matriz_cov que calcula la matriz de covarianza a
%partir de los datos (Estimador). 
 sigma_A=matriz_cov(a);
 sigma_B=matriz_cov(b);
 sigma_C=matriz_cov(c);

% Tomo las dimensiones de la imagen
[m1,n1,b1]=size(n);

% Creo una matriz de dos dimeniones para luego indicar a que clase
% pertenece cada pixel (clasifico colocando en cada pixel valores del 1 al
% 3 dependiendo la clase a la que pertenezcan), es decir las predicciones.
matrix_1=zeros(m1,n1);

for i=1:m1
    i
    for j=1:n1
        
%       Creo tres gausianas multivariadas para luego comprar la probabilidades en cada pixel  
        pixel = [double(n(i,j,1)) double(n(i,j,2)) double(n(i,j,3))];
        F_A = mvnpdf(pixel,muA,sigma_A);
        F_B = mvnpdf(pixel,muB,sigma_B);
        F_C = mvnpdf(pixel,muC,sigma_C);
%       Con estos if, pregunto cual de las tres probabilidades es mayor, y luego pinto del 
%       color correspondiente, cada pixel.
        if(F_A >= F_B & F_A>=F_C)
            n(i,j,1)=muA(1);
            n(i,j,2)=muA(2);
           n(i,j,3)=muA(3);
%          Matriz de confusion  
           matrix_1(i,j)=3;
        elseif(F_C >= F_B & F_C>=F_A)
               n(i,j,1)=muC(1);
                n(i,j,2)=muC(2);
                n(i,j,3)=muC(3);
%          Matriz de confusion                 
                matrix_1(i,j)=2;
        elseif(F_B >= F_A & F_B>=F_A)
                 n(i,j,1)=muB(1);
                n(i,j,2)=muB(2);
                n(i,j,3)=muB(3);
%          Matriz de confusion                 
                matrix_1(i,j)=1;
         end
    end 
end 
% uint8(n);
% imshow(n);

%Creo matriz de dos dimensiones. En dicha matriz voy a poner a que clase
%pertenece cada pixel (en esta matriz tengo los datos reales), poniendo 
% numeros del 1 al 6 en cada posicion de la matriz. (Clasifico la imagen)
matrix=zeros(m1,n1);

% Leo la imagen real y la transformo en una matriz.
y=imread('circular_verdad.png');

% Tomo un pixel de cada color para obtener sus valores RGB. (en la imagen
% real)

rojo=[255,0,0];
negro=[0,0,0];
gris=[175,175,175];

for i=1:m1
  
    for j=1:n1
        
    if(y(i,j,1)==rojo(1) & y(i,j,2)==rojo(2) & y(i,j,3)==rojo(3) )
    matrix(i,j)=1;
    
    elseif( y(i,j,1)==negro(1) & y(i,j,2)==negro(2) & y(i,j,3)==negro(3) )
    matrix(i,j)=2; 
        
    else
    matrix(i,j)=3;
   
    end
end

end

% Matriz de confusion
%Transformo las matrices en vectores para usarlos en confusionmat
r1=reshape(matrix_1(:,:),numel(matrix_1(:,:)),1);
r2=reshape(matrix(:,:),numel(matrix(:,:)),1);
% 3 clases
order = [1 2 3];
% Creo la matriz de confusion, tomando como r2 la matriz original
% y r1 las predicciones
[confusion_matrix,order] = confusionmat(r2, r1, 'order', order)
figure(4);
imshow(y);
figure(5);
imshow(n);
