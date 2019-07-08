% generateLD; Last updated on 1/4/07; 
% Greg Lang; Harvard University

% This is a program which generates the Luria-Delbruck distribution for a
% given value for "m" and stores the distribution in the array "ldDist."

% Sarkar S, Ma WT, Sandri GH. On fluctuation analysis: a new, simple and
% efficient method for computing the expected number of mutants.
% Genetica. 1992;85(2):173-9.

function out=generateLD(m,max); % Import "m" and "max" from user.
% "m" is the parameter which describes the distribution.
% "max" is the maximum number of mutants per culture for which the probability will be determined.

ldDist = [exp(-m)]; % the first value of the array is the probability of observing zero mutants.

% This loop fills out the array "ldDist," and for each run, determines the
% probability of observing "i" mutants in a culture.
for i=[1:max],
    x = [0:length(ldDist)-1];
    ldDist = [ldDist m/length(x)*sum(ldDist./(length(x)-x+1))];
end

out = ldDist; % Output the array "ldDist"

% out = transpose(cumsum(ldDist)); % Output the array "ldDist"