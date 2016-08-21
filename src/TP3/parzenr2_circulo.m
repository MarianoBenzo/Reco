function p = parzenr2_circulo(x, X, radio)
% x = punto a evaluar
% X = muestras
% h = longitud del lado del (hiper)cubo
% N = cantidad de iteraciones
L = length(X);
kn = 0;

% Solucion usando un circulo como ventana en lugar de un hipercubo

for i=1:L
	distancia = sqrt((x(1)-X(i,1))^2+(x(2)-X(i,2))^2);
	if (distancia <= radio), kn = kn+1; end
end
p = (kn/L)/(pi * radio^2);
