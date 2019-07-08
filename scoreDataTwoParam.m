% scoreDataTwoParam; Last updated on 1/7/07; 
% Greg Lang; Harvard University

% This is a program which calculates the negative log of the probability of
% observing the data given values for "m" and "d".

% Lang GI, Murray AW.  Estimating the per-base-pair mutation rate in the
% yeast, Saccharomyces cerevisiae.  Genetics.

function out=SCORE(data,m,d); % Import "data" and "m" from user

% This loop converts the data from a list of the number of mutants per
% culture to an array where the position "i+1" corresponds to the number of
% cultures with "i" mutants.
for i=[0:max(data)],
    tabdata(1,i+1)=length(find(data==i));
end

dist=generateTwoParam(m,d,max(data)); % Uses the m-file "generateTwoParam" to generate the Luria-Delbruck distribution with parameters "m" and "d" out to 100.
score=sum(-log(dist.^tabdata)); % Calculate the -log of the probability of observing the data

out=score; % Output the -log probability


