% sampleTwoParam; Last updated on 1/8/07; 
% Greg Lang; Harvard University

% This program simulates a fluctuation experiment by sampling from the
% combined Luria-Delbruck/Poisson distribution.

function out=sample(m,d,samples);
%   the imput requires three variables:  
%   m = the expected number of mutations per culture
%   d = post-plating growth (the number of cell divisions per plated cell)
%   samples = the number of cultures to be simulated

r=[];                           % "r" is the output array: each number in the array is a different culture.  The maximum value for "r" is 101--this is set by the m-file, "generateTwoParam"

dist=generateTwoParam(m,d,1000);     % define the variable "dist" = the combined Luria-Delbruck (parameter "m") and Poisson (parameter "d") distributions
cdist=[cumsum(dist)];        % sets "cdist" = the cumulative of "dist".  the "1" ensures that the cumulateve distribution ends at unity.

for i=[1:samples],              % loop - each loop calculates the number of mutants in one culture
    samp=cdist-rand(1);         % subtract a uniform random number [0,1] from the cumulative distribution
    samp(find(samp > 0)) = 0;   % convert all positive values to 0
    samp(find(samp < 0)) = 1;   % convert all negative values to 1
    r=[r sum(samp)];            % sum the positive values and add this number to the array of mutants per culture
end

out=r;                          %output the cultures