function p = knn_2D(x, X)
% x = punto a evaluar
% X = vector de muestras
% k = número de vecinos

L = length(X);

% Se toma k = raiz de L
k = fix(sqrt(L));

% Calculo distancias a los puntos y las ordeno para filtrar los k más cercanos
d = sqrt((x(1)-X(:,1)).^2+(x(2)-X(:,2)).^2);
ds = sort(d);

% Calculo V como el área del círculo que incluye a los k vecinos más cercanos
V = pi*(ds(min(L,k)))^2;

p = (k/L)/V;
end