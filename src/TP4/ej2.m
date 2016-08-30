function [Z,W] = FMD(X,Y,r)
    
% Uso:
%       
%       [Z,W]=FDA(X,Y,r)
%
% Input:
%    X:      Matriz de (DxN) con los datos a analizar, donde:
%            D: Dimensión de los datos.
%            N: Cantidad de datos. 
%    Y:      Vector con etiqueta de la clase para cada dato.
%    r:      Dimensión a la cual queremos llevar nuestros datos.
%            
% Output:
%    W:      (Dxr) matriz de transformación (Z=T'*X)
%    Z:      (rxN) matriz con los datos reducida su dimensión.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
 
Z=0;
    W=0;
    [d,n]=size(X);
    [nY,dum]=size(Y);
  
    fprintf('\nCantidad total de datos: n = %d\n',n);
    fprintf('Dimensión original de los datos: d = %d\n',d);
    
    i=1;
 
    clases=unique(Y');
    NumeroDeClases = size(clases,2);
    if(nargin==2)
        r=NumeroDeClases-1;
    end
    fprintf('Numero de clases = \n',NumeroDeClases);
    fprintf('Clases: %d\n',char(clases));
    fprintf('Reducir a dimensión: r = %d\n',r)
   
    LocalMu = cell(1,NumeroDeClases);
    CovVal = cell(1,NumeroDeClases);
    sizeC=zeros(1,NumeroDeClases);
 
    for clases=unique(Y')
        Xc=X(:,Y==clases);
        LocalMu(i) = {mean(Xc,2)};
        CovVal(i) = {cov(Xc')};
        sizeC(i)=size(Xc,2);
        i=i+1;
    end
    
    
    Global_Mu = zeros(d,1);
    
    for i = 1:NumeroDeClases
        Global_Mu = Global_Mu+LocalMu{i};
    end
    Global_Mu=Global_Mu./NumeroDeClases;
    
    SB = zeros(d,d);
    SW = zeros(d,d);
    
    for i = 1:NumeroDeClases
        SB = SB + sizeC(i).*(LocalMu{i}-Global_Mu)*(LocalMu{i}-Global_Mu)';
        SW = SW+CovVal{i};
    end
    
    invSw = inv(SW);
    invSwSB = invSw * SB;

    [V,D] = eig(invSwSB);
    eigval=diag(D);
    
    % Sorting
    [sort_eigval,sort_eigval_index]=sort(eigval,'descend');
    
    W=V(:,sort_eigval_index(1:r));
   
    Z = W'*X;
    [dZ,nZ]=size(Z);
    fprintf('Dimensión reducida y el nuevo tamaño de los datos es %d X %d\n',dZ,nZ);
    
end