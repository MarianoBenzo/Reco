% Leo la imagen y la transformo en una matriz
x=imread('phantom.png');
aux=x;

%Un pixel de cada color para usar como mu
% Clase verde
a1 = [123,239,134];
% Clase azul
a2 = [126,123,239];
% Clase marron
a3 = [188,152,81];
% Clase naranja
a4 = [239,124,67];
% Clase amarillo
a5 = [201,199,60];
% Clase verde
a6 = [80,147,53];

% Creo los sigmas distintos para cada clase
sigma1 = [400 10.5 ;10.5 150];
sigma2 = [300 0.3 ;0.3 250];
sigma3 = [250 0.7 ;0.7 200];
sigma4 = [410 0.3 ;0.3 100];
sigma5 = [370 0.2 ;0.2 250];
sigma6 = [500 12.5 ;12.5 210];

% Dimensiones de la imagen
[m,n,z]=size(x);

% Creo una matriz de dos dimeniones para luego indicar a que clase
% pertenece cada pixel (clasifico colocando en cada pixel valores del 1 al
% 6 dependiendo la clase a la que pertenezcan).
matrix_1=zeros(m,n);

% Inicializo ancho, largo y contador en 0
for z=1:6
alto(z)=0;
ancho(z)=0;
contador(z)=0;
end

% EN ESTE FOR RECORRO LA MATRIZ DE LA IMAGEN PREGUNTANDO A QUE COLOR
% PERTENECE CADA PIXEL. LUEGO LOS VOY ACUMULANDO EN ANCHO Y LARGO. TAMBIEN
% CALCULO CUANTOS PIXEL SON DE CADA COLOR PARA ESTIMAR DEPUES.

% CON matrix_1 VOY COMPLETANDO UNA MATRIZ DE 2 DIMENSIONES QUE INDICA A QUE
% CLASE PERTENECE CADA PIXEL (PARA LUEGO USAR confusionmat)
for i=1:m
    for j=1:n
        if(x(i,j,1)==a1(1) & x(i,j,2)==a1(2) & x(i,j,3)==a1(3));
        alto(1)=alto(1)+i;
        ancho(1)=ancho(1)+j;
        contador(1)=contador(1)+1;
    
        elseif(x(i,j,1)==a2(1) & x(i,j,2)==a2(2) & x(i,j,3)==a2(3));
        alto(2)=alto(2)+i;
        ancho(2)=ancho(2)+j;
        contador(2)=contador(2)+1;  
       
        elseif(x(i,j,1)==a3(1) & x(i,j,2)==a3(2) & x(i,j,3)==a3(3));
        alto(3)=alto(3)+i;
        ancho(3)=ancho(3)+j;
        contador(3)=contador(3)+1; 
      
        elseif(x(i,j,1)==a4(1) & x(i,j,2)==a4(2) & x(i,j,3)==a4(3));
        alto(4)=alto(4)+i;
        ancho(4)=ancho(4)+j;
        contador(4)=contador(4)+1;
      
        elseif(x(i,j,1)==a5(1) & x(i,j,2)==a5(2) & x(i,j,3)==a5(3));
        alto(5)=alto(5)+i;
        ancho(5)=ancho(5)+j;
        contador(5)=contador(5)+1;
        
        elseif(x(i,j,1)==a6(1) & x(i,j,2)==a6(2) & x(i,j,3)==a6(3));
        alto(6)=alto(6)+i;
        ancho(6)=ancho(6)+j;
        contador(6)=contador(6)+1;   

        end
    end
end

% Armo las estimaciones de mu (EMV)
for k=1:6
    mu(k,:)=[alto(k)/contador(k),ancho(k)/contador(k)];
end

% Transforma la matriz de la imagen en una matriz de ceros
x=zeros(m,n,3);
x=uint8(x);

for i=1:m
    i
    for j=1:n
% CREO LAS MULTIVARIANTE CON MU Y SIGMA. LUEGO RECORRO LA IMAGEN CON EL FOR Y CLASIFICO 
% PIXEL POR PIXEL.
% COMPARANDO LOS RESULTADOS DE LAS 6 GAUSSIANAS CLASIFICO.        
        F_A=mvnpdf([i j],mu(1,:),sigma1);
        F_B=mvnpdf([i j],mu(2,:),sigma2);
        F_C=mvnpdf([i j],mu(3,:),sigma3);
        F_D=mvnpdf([i j],mu(4,:),sigma4);
        F_E=mvnpdf([i j],mu(5,:),sigma5);
        F_F=mvnpdf([i j],mu(6,:),sigma6);
%        ESTOS IF PREGUNTAN CUAL DE LAS 6 PROBABILIDADES ES MAYOR, Y LOS
%        CLASIFICA (PINTA DEL COLOR CORRESPONDIENTE EL PIXEL)        
         if(F_A >= F_B & F_A>=F_C & F_A >= F_D & F_A >= F_E & F_A >= F_F )
             x(i,j,1)=a1(1);
             x(i,j,2)=a1(2);
            x(i,j,3)=a1(3);
                 %Clasificacion para matriz de confusion
                 matrix_1(i,j)=1;
         elseif(F_B >= F_A & F_B>=F_C & F_B >= F_D & F_B >= F_E & F_B >= F_F )
                x(i,j,1)=a2(1);
                 x(i,j,2)=a2(2);
                x(i,j,3)=a2(3);
                 %Clasificacion para matriz de confusion
                matrix_1(i,j)=2;
         elseif(F_C >= F_A & F_C>=F_B & F_C >= F_D & F_C >= F_E & F_C >= F_F )
                  x(i,j,1)=a3(1);
                 x(i,j,2)=a3(2);
                 x(i,j,3)=a3(3);
                 %Clasificacion para matriz de confusion
                matrix_1(i,j)=3;
         elseif(F_D >= F_A & F_D>=F_B & F_D >= F_C & F_D >= F_E & F_D >= F_F )
                  x(i,j,1)=a4(1);
                 x(i,j,2)=a4(2);
                 x(i,j,3)=a4(3);  
                 %Clasificacion para matriz de confusion
                matrix_1(i,j)=4;
         elseif(F_E >= F_A & F_E>=F_B & F_E >= F_C & F_E >= F_D & F_E >= F_F )
                  x(i,j,1)=a5(1);
                 x(i,j,2)=a5(2);
                 x(i,j,3)=a5(3);  
                 %Clasificacion para matriz de confusion
                 matrix_1(i,j)=5;
         elseif(F_F >= F_A & F_F>=F_B & F_F >= F_C & F_F >= F_D & F_F >= F_E )
                  x(i,j,1)=a6(1);
                 x(i,j,2)=a6(2);
                 x(i,j,3)=a6(3);   
                 %Clasificacion para matriz de confusion
                 matrix_1(i,j)=6;
            end
      end
 end 

imshow(x)

% Matriz de confusion
%Datos originales de la imagen
matrix_2=zeros(m,n);
% La funcion auxiliar clasificar, indica a que clase pertenece cada
% pixel en una matriz (matrix_2) de dos dimeniones (provee la verdad terrestre)
matrix_2=clasificar(aux,matrix_2,a1,a2,a3,a4,a5,a6,m,n);
%Transformo las matrices en vectores para usarlos en confusionmat
r1=reshape(matrix_1(:,:),numel(matrix_1(:,:)),1);
r2=reshape(matrix_2(:,:),numel(matrix_2(:,:)),1);
% 7 clases.
order=[1,2,3,4,5,6,7];
% Creo la matriz de confusion, tomando como r2 la matriz original
% y r1 las predicciones
[confusion_matrix,order] = confusionmat(r2, r1,'order',order);
confusion_matrix([1:6],[1:6])
order