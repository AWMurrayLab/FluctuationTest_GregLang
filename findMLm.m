% findMLm; Last updated on 1/4/07; 
% Greg Lang; Harvard University

% This is a program which finds the most-likely value of "m" given data
% from a Luria-Delbruck fluctuation assay.

% Sarkar S, Ma WT, Sandri GH. On fluctuation analysis: a new, simple and
% efficient method for computing the expected number of mutants.
% Genetica. 1992;85(2):173-9.

function out=ML(data); % Import data from user.

m=median(data)+0.1; % To perform a maximum likelihood analysis, you first need to make a guess of "m".  Here we guess that "m" is the median value of from the fluctuation data.  We add 0.1 to the median to ensure that our initial guess is > 0.
m(find(m>10))=10; % If the median is > 10, we set the initial guess at 10.

% Below the five loops optimize one digit at a time.

scores=[0 1 0]; % Set the "scores" array to a trivial value which fails the below test "scores(2) > min(scores)"
while scores(2) > min(scores),
    ms=[m-1 m m+1]; % the "ms" array the current estimate for "m" and the two adjacent values
    ms(find(ms<0))=0;
    scores=[scoreData(data,ms(1)) scoreData(data,ms(2)) scoreData(data,ms(3))]; % Using the m-file "scoreData," determine the log probability of "m" given the data
    m=ms(find(scores==min(scores))); % Set the value for "m" to the lowest of the three scores
end

scores=[0 1 0];
while scores(2) > min(scores),
    ms=[m-0.1 m m+0.1];
    scores=[scoreData(data,ms(1)) scoreData(data,ms(2)) scoreData(data,ms(3))];
    m=ms(find(scores==min(scores)));
end

scores=[0 1 0];
while scores(2) > min(scores),
    ms=[m-0.01 m m+0.01];
    scores=[scoreData(data,ms(1)) scoreData(data,ms(2)) scoreData(data,ms(3))];
    m=ms(find(scores==min(scores)));
end

scores=[0 1 0];
while scores(2) > min(scores),
    ms=[m-0.001 m m+0.001];
    scores=[scoreData(data,ms(1)) scoreData(data,ms(2)) scoreData(data,ms(3))];
    m=ms(find(scores==min(scores)));
end

scores=[0 1 0];
while scores(2) > min(scores),
    ms=[m-0.0001 m m+0.0001];
    scores=[scoreData(data,ms(1)) scoreData(data,ms(2)) scoreData(data,ms(3))];
    m=ms(find(scores==min(scores)));
end

out=[m]; % Output the maximum likelihood value of "m".