function output = RVGexp(lam,numCust)

matrix = zeros(1,numCust);

for i=1:numCust
	R = rand();
	matrix(i) = (-1/lam) * log10(1-R);
	
	while matrix(i) >= 1
		matrix(i) = matrix(i) - 1;
	end
	
	matrix(i) = ceil(matrix(i) * 100);
end

output = matrix;