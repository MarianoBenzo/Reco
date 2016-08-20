% Estimacion de media y varianza de una N(0,1)
h = 10
N = 1000
n = 1000
x = 0
R = normrnd(0, 1, n, 1)

p = parzen_cubo_1D(x,R,h,N)
figure(1)
plot(p)

pk = knn_1D(x,R,N)
figure(2)
plot(pk)