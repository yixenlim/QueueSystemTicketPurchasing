function output = lcg(a,c,m,numCust)

matrix = zeros(1,numCust);
rns = floor(100 * rand() + 1);

for i = 1:numCust
    matrix(1,i) = mod(a * rns + c,m);
	rns = matrix(1,i);
end

output = matrix;
