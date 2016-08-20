function [ L, pi_2, mu_1, mu_2, Sigma_1, Sigma_2 ] = EM(X,pi_1,pi_2,mu_1,mu_2,Sigma_1,Sigma_2)

	R = Expectation(X,pi_1,pi_2,mu_1,mu_2,Sigma_1,Sigma_2);

	[ pi_1, pi_2, mu_1, mu_2, Sigma_1, Sigma_2 ] = Maximization(X, R, pi_1,pi_2,mu_1,mu_2,Sigma_1,Sigma_2);

	L = Likelihood(X, pi_1,pi_2,mu_1,mu_2,Sigma_1,Sigma_2);

end

function R = Expectation(X,pi_1,pi_2,mu_1,mu_2,Sigma_1,Sigma_2)
% R = Responsibilidad

mu_1
R=pi_1*mvnpdf(X,mu_1,Sigma_1);
R=[R pi_2*mvnpdf(X,mu_2,Sigma_2)];
vec_norm=sum(R,2);
R=R./[vec_norm vec_norm];

end

function [ pi_1, pi_2, mu_1, mu_2, Sigma_1, Sigma_2 ] = Maximization(X, R, pi_1,pi_2,mu_1,mu_2,Sigma_1,Sigma_2)

N = sum(R);

% Recalculo los mu
mu_1 = 1/(N(1)) * ( R(:,1)' * X );
mu_2 = 1/(N(2)) * ( R(:,2)' * X );

Sigma_1

% Recalculo los sigma
Sigma_1 = zeros(2,2);
Sigma_2 = zeros(2,2);

Sigma_1



for i=1:length(X),
Sigma_1 = Sigma_1 + R(i,1) * (X(i,:) - mu_1)' * (X(i,:) - mu_1);
Sigma_2 = Sigma_2 + R(i,2) * (X(i,:) - mu_2)' * (X(i,:) - mu_2);
end

Sigma_1

Sigma_1 = Sigma_1/(N(1));
Sigma_2 = Sigma_2/(N(2));

Sigma_1


% Recalculo los pi
pi_1 = N(1) / length(X);
pi_2 = N(2) / length(X);

end

function L = Likelihood(X, pi_1,pi_2,mu_1,mu_2,Sigma_1,Sigma_2)

L = 0;

for i=1:length(X),
	L = L + log( pi_1 * mvnpdf(X,mu_1,Sigma_1) + pi_2 * mvnpdf(X,mu_2,Sigma_2) ); 
end

end