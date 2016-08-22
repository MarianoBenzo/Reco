% Estimacion de media y varianza de una N(0,1)

N = 100000;
vector_n = [ 10, 100, 1000, 10000 ];
vector_x = [ 0, 1, 2];

h = 50;
fig = 1;

for i=1:length(vector_x)
	x = vector_x(i);
	for j=1:length(vector_n)
		n = vector_n(j);
		R = normrnd(0, 1, n, 1);
		pd = makedist('Normal');
		p_real = pdf(pd, x);
		p_parzen = parzen_cubo_1D(x,R,h,N);
		p_knn = knn_1D(x,R,N);
		img = figure(fig);
		title(['Estimación de la pdf para x = ', num2str(x), ' con una muestra de n = ', num2str(n)]);
		hold on;
		plot(p_parzen, 'Color','m');
		plot(p_knn, 'Color','c');
		a = axis;
		plot(a(1:2),[p_real,p_real], 'Color', [.7 .7 .7]);
		legend('Ventana de Parzen', 'Kn vecinos', 'Valor real');
		xlabel('N');
		ylabel('p(x)');
		hold off;
		saveas(img, ['ej1_x', num2str(x), '_n', num2str(n), '.png']);
		fig = fig+1;
	end
end