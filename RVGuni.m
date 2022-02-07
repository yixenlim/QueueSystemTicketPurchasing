function output = RVGuni(a,b,numCust)
    
matrix = zeros(1,numCust);

for i=1:numCust
	R = rand();
	matrix(i) = ceil(a + (b - a) * R);
end

output = matrix;