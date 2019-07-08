% sampleLD; Last updated on 1/4/07; 
% Greg Lang; Harvard University

% This program simulates a fluctuation experiment by sampling from the
% Luria-Delbruck distribution.

function out=sample(m,samples); % Import variables from user
%   "m" is the parameter which describes the distribution.
%   samples = the number of cultures to be simulated

r=[];                           % "r" is the output array: each number in the array is a different culture.

dist=generateLD(m,1000);        % define the variable "dist" = the Luria-Delbruck distribution with parameter "m".  The "1000" sets the maximum value for mutants per culture in this simulation (in this case 1001).
cdist=cumsum(dist)             % sets "cdist" = the cumulative of "dist".

for i=[1:samples],              % loop - each loop calculates the number of mutants in one culture
    samp=cdist-rand(1);         % subtract a uniform random number [0,1] from the cumulative distribution
    samp(find(samp > 0)) = 0;   % convert all positive values to 0
    samp(find(samp < 0)) = 1;   % convert all negative values to 1
    r=[r sum(samp)];            % sum the positive values and add this number to the array of mutants per culture
end

out=r;                          %output the cultures