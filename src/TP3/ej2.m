% Genero dos clases en R2

% Caso clases con dos Gaussinas
mu = [2,3];
sigma = [1,1.5;1.5,3];
rng default  % For reproducibility
F1 = mvnpdf(mu, sigma);
r1 = mvnrnd(mu,sigma,1000);

mu1 = [4,7];
sigma1 = [2.5,1.0;1.0,2];
rng default  % For reproducibility
F2 = mvnpdf(mu1, sigma1);
r2 = mvnrnd(mu1,sigma1,1000);

%  Figura1 : Grafico de las dos clases
figure(1)
hold on;
plot(r1(:,1),r1(:,2),'b*')
plot(r2(:,1),r2(:,2),'r*')

indices_min = r1(1, :);
indices_max = r1(1, :);
for i=1:1000
	indices_min_i = zeros(2);
	indices_max_i = zeros(2);
	for j=1:2
		if (r1(i,j) <= r2(i,j))
			indices_min_i(j) = r1(i,j);
			indices_max_i(j) = r2(i,j);
		else 
			indices_min_i(j) = r2(i,j);
			indices_max_i(j) = r1(i,j);
		end
		if (indices_min_i(j) < indices_min(j))
			indices_min(j) = indices_min_i(j);
		end
		if (indices_max_i(j) > indices_max(j))
			indices_max(j) = indices_max_i(j);
		end
	end
end

x1 = floor(indices_min(1));
x2 = ceil(indices_max(1));
m_width = x2-x1;
y1 = floor(indices_min(2));
y2 = ceil(indices_max(2));
m_height = y2 - y1;
matrix = zeros([m_width m_height]);

% Parametros ventana de parzen
ventanas = [10, 4, 2, 1, 0.5];
dim = 2;
fig = 2;

for k=1:length(ventanas)

    h = ventanas(k);

    %  Usando ventana hipercubica
    img = figure(fig);
    fig = fig+1;
    title(['Particiones resultantes usando hipercubo de lado = ', num2str(h)]);
    hold on;
    plot(r1(:,1),r1(:,2),'b*')
    plot(r2(:,1),r2(:,2),'r*')

    for i=x1:x2
        for j=y1:y2
            x_ij = [i, j];
            p1 = parzen_hipercubo(x_ij, r1, h, dim);
            p2 = parzen_hipercubo(x_ij, r2, h, dim);
            if ( p1 > p2 )
                p = patch([i-0.5 i+0.5 i+0.5 i-0.5],[j-0.5 j-0.5 j+0.5 j+0.5],'b');
                set(p,'FaceAlpha',0.1);
                set(p,'LineStyle','none');
            elseif ( p2 > p1 )
                p = patch([i-0.5 i+0.5 i+0.5 i-0.5],[j-0.5 j-0.5 j+0.5 j+0.5],'r');
                set(p,'FaceAlpha',0.1);
                set(p,'LineStyle','none');
            end
        end
    end
    hold off;
    saveas(img, ['ej2_hipercubo_h', num2str(h), '.png']);

    % Usando ventana circular
    img = figure(fig);
    fig = fig + 1;
    title(['Particiones resultantes usando ventana circular de radio = ', num2str(h)]);
    hold on;
    plot(r1(:,1),r1(:,2),'b*')
    plot(r2(:,1),r2(:,2),'r*')

    for i=x1:x2
        for j=y1:y2
            x_ij = [i, j];
            p1 = parzenr2_circulo(x_ij, r1, h);
            p2 = parzenr2_circulo(x_ij, r2, h);
            if ( p1 > p2 )
                p = patch([i-0.5 i+0.5 i+0.5 i-0.5],[j-0.5 j-0.5 j+0.5 j+0.5],'b');
                set(p,'FaceAlpha',0.1);
                set(p,'LineStyle','none');
            elseif ( p2 > p1 )
                p = patch([i-0.5 i+0.5 i+0.5 i-0.5],[j-0.5 j-0.5 j+0.5 j+0.5],'r');
                set(p,'FaceAlpha',0.1);
                set(p,'LineStyle','none');
            end
        end
    end
    hold off;
    saveas(img, ['ej2_circular_h', num2str(h), '.png']);

end

% Usando knn
img = figure(fig);
title('Particiones resultantes usando k vecinos más cercanos');
hold on;
plot(r1(:,1),r1(:,2),'b*')
plot(r2(:,1),r2(:,2),'r*')

for i=x1:x2
    for j=y1:y2
        x_ij = [i, j];
        p1 = knn_2D(x_ij, r1);
        p2 = knn_2D(x_ij, r2);
        if ( p1 > p2 )
            p = patch([i-0.5 i+0.5 i+0.5 i-0.5],[j-0.5 j-0.5 j+0.5 j+0.5],'b');
            set(p,'FaceAlpha',0.1);
            set(p,'LineStyle','none');
        elseif ( p2 > p1 )
            p = patch([i-0.5 i+0.5 i+0.5 i-0.5],[j-0.5 j-0.5 j+0.5 j+0.5],'r');
            set(p,'FaceAlpha',0.1);
            set(p,'LineStyle','none');
        end
    end
end
hold off;
saveas(img, 'ej2_knvecinos.png');

