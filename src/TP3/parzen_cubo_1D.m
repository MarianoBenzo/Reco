function p = parzen_cubo_1D(x,X,h,N)
% x = punto a evaluar
% X = vector de muestras
% h = longitud del lado del (hiper)cubo
L = length(X)
p = zeros(1, N)
h1 = h
for j= 1:N
    h = h1 / sqrt (j)
    kn = 0
    for i=1:L
    if abs((x-X(i))/h) <= 0.5, kn = kn+1; end
    end
    p(j) = (kn/L)/h;
end
