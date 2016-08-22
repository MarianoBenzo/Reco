function p = knn_1D(x,X,N)
% x = punto a evaluar
% X = vector de muestras
% k = número de vecinos
p = zeros(1, N);
for j=1:N
    k = fix(sqrt(j));
    L = length(X);
    d = abs(X - x);
    ds = sort(d);
    V = 2*ds(min(L,k));
    p(j) = (k/L)/V;
end