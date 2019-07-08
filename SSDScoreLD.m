% SSDScoreLD; Last updated on 1/8/07; 
% Greg Lang; Harvard University

% This program calculates the sum-of-the-square difference between the
% cumulative distribution of the data and the cumulative Luria-Delbruck
% distribution with the most-likely parameter "m" determined for the data.

% Lang GI, Murray AW.  Estimating the per-base-pair mutation rate in the
% yeast, Saccharomyces cerevisiae.  Genetics.

function out=SCORE(data); % Import "data" from user.

m=findMLm(data);                                        % find the most-likely value for "m" given the data.
cultures=length(data);                                  % the length of the array "data" is the number of cultures counted in the fluctuation assay
actu = cumsum(generateLD(m,1000));                      % the array "actu" is the cumulative Luria-Delbruck distribtuion with parameter "m".

% This loop converts the data from a list of the number of mutants per
% culture to an array where the position "i+1" corresponds to the number of
% cultures with "i" mutants.
for i=[0:length(actu)-1],
    tabdata(1,i+1)=length(find(data==i));
end

score =[sum((cumsum(tabdata)/cultures - actu).^2)];     % calculate the difference between the cumulative distribution of the data (normalized by the number of cultures) and the cumulative Luria-Delbruck distribution.

% out=[score];                                            % output the sum-of-the-square difference.
out=[tabdata];                                            % output the sum-of-the-square difference.