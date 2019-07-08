% SSDScoreTwoParam; Last updated on 1/8/07; 
% Greg Lang; Harvard University

% This program calculates the sum-of-the-square difference between the
% cumulative distribution of the data and the cumulative
% Luria-Delbruck/Poisson distribution with parameters "m" and "d"
% determined from the data.

% Lang GI, Murray AW.  Estimating the per-base-pair mutation rate in the
% yeast, Saccharomyces cerevisiae.  Genetics.

function out=SCORE(data);   % Import "data" from user.

md=findMLmTwoParam(data);                               % find the most-likely values for "m" and "d" given the data.
m=md(1);
d=md(2);
cultures=length(data);                                  % the length of the array "data" is the number of cultures counted in the fluctuation assay
dist = generateTwoParam(m,d,1000);
actu = cumsum(dist);                                    % the array "actu" is the cumulative Luria-Delbruck/Poisson distribution with parameters "m" and "d".

% This loop converts the data from a list of the number of mutants per
% culture to an array where the position "i+1" corresponds to the number of
% cultures with "i" mutants.
for i=[0:length(actu)-1],
    tabdata(1,i+1)=length(find(data==i));
end

score =[sum((cumsum(tabdata)/cultures - actu).^2)];     % calculate the difference between the cumulative distribution of the data (normalized by the number of cultures) and the cumulative Luria-Delbruck/Poisson distribution.

out=[score];                                            % output the sum-of-the-square difference.
