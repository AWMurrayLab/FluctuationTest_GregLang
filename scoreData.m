% scoreData; Last updated on 1/4/07; 
% Greg Lang; Harvard University

% This is a program which calculates the negative log of the probability of
% observing the data given a value for "m"

% Sarkar S, Ma WT, Sandri GH. On fluctuation analysis: a new, simple and
% efficient method for computing the expected number of mutants.
% Genetica. 1992;85(2):173-9.

function out=SCORE(data,m); % import "data" and "m" from user

% This loop converts the data from a list of the number of mutants per
% culture to an array where the position "i+1" corresponds to the number of
% cultures with "i" mutants.
for i=[0:max(data)],
    tabdata(1,i+1)=length(find(data==i));
end

dist=generateLD(m,max(data)); % Uses the m-file "generateLD" to generate the Luria-Delbruck distribution with parameter "m" out to the maximum observed number of mutants per culture
score=sum(-log(dist.^tabdata)); % Calculate the -log of the probability of observing the data

out=score; % Output the -log probability