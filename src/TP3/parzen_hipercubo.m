function p = parzen_hipercubo(x, X, h, d)
% x = punto a evaluar
% X = muestras
% h = longitud del lado del (hiper)cubo
L = length(X);
kn = 0;

% Solucion usando un hipercubo de dimension d
for i=1:L
	is_inside = 0;
	for j=1:d
		if ( (abs(x(j)-X(i,j))/h) <= 0.5)
			is_inside = is_inside + 1;
		end
	end
	if (is_inside == d)
		kn = kn+1;
	end
end

p = (kn/L)/(h^d);
end
