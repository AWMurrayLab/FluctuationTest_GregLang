% generatePO; Last updated on 1/8/07; 
% Greg Lang; Harvard University

% This is a program which generates the Poisson distribution for a
% given value for "lambda" and stores the distribution in the array "dist".

function out=sample(lambda,max);

dist=zeros(1,max+1);

% This loop determines the Poisson probability of observing "x" given the
% chosen "lambda".
for x=[0:max],
    dist(1,x+1)=(lambda^x/factorial(x)*exp(-lambda));
    x=x+1;
end
    
out=dist; % Output the array "dist"