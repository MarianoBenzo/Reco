function Fisher(X)

% Uso:
%       
%      Fisher(X)
%
% Input:
%    X:      Matriz de (NxDxC) con los datos a analizar, donde:
%            N: Cantidad de datos.
%            D: Dimensión de los datos (En este caso 2).         
%            C: Cantidad de clases (En este caso 2).
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

	S_W=zeros(2);
    m_W=[0 0];
    clases= size(X,3);
    color = [ 0 0 1 % 1 BLUE
   0 1 0 % 2 GREEN (pale)
   1 0 0 % 3 RED
   0 1 1 % 4 CYAN
   1 0 1 % 5 MAGENTA (pale)
   1 1 0 % 6 YELLOW (pale)
   0 0 0 % 7 BLACK
   0 0.75 0.75 % 8 TURQUOISE
   0 0.5 0 % 9 GREEN (dark)
   0.75 0.75 0 % 10 YELLOW (dark)
   1 0.50 0.25 % 11 ORANGE
   0.75 0 0.75 % 12 MAGENTA (dark)
   0.7 0.7 0.7 % 13 GREY
   0.8 0.7 0.6 % 14 BROWN (pale)
   0.6 0.5 0.4 ]; % 15 BROWN (dark)
    
% Grafico las clases
	for i=1:clases,
        
		figure(1)
		plot(X(:,1,i),X(:,2,i),'.', 'Color', color(i,:));
		hold on


		m(i,:)=mean(X(:,:,i));
		plot(m(i,1),m(i,2),'O', 'Color', color(7,:));
		S(:,:,i)= cov(X(:,:,i));

		S_W= S_W + S(:,:,i);
		m_W= m_W - m(i,:);
    end
    
    %Calculo W y grafico
    w=inv(S_W)*((m(1,:)*2)+m_W)'; %CON DOS CLASES: w=inv(S_W)*(m(1,:) - m(2,:))';
	plotv(w);
	hold off

	figure(2);
	w=w/norm(w);
    
    %Proyecto los datos en el vector W y grafico
	for i=1:clases,
        
		proy(i,:)=w'*X(:,:,i)';
		plot(proy(i,:),zeros(1,size(X,1)),'x', 'Color', color(i,:))
		hold on
	end
	hold off
	
end