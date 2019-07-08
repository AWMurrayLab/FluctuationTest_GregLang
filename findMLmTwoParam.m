% findMLmTwoParam; Last updated on 03/10/10; 
% Greg Lang; Harvard University

% This is a program which finds the most-likely value of "m" and "d" given data from a Luria-Delbruck fluctuation assay.

% Lang GI, Murray AW.  Estimating the per-base-pair mutation rate in the
% yeast, Saccharomyces cerevisiae.  Genetics.

function out=ML(data); % Import data from user.

m=median(data)+0.1; % To perform a maximum likelihood analysis, you first need to make a guess of "m".  Here we guess that "m" is the median value of from the fluctuation data.  We add 0.1 to the median to ensure that our initial guess is > 0.
m(find(m>10))=10; % If the median is > 10, we set the initial guess at 10.
d=0;


previous_m = 0;
while m ~= previous_m,
    
    previous_m = m;
    
    % OPTIMIZE "m":  Below the five loops optimize one digit at a time.
        
    scores=[0 1 0]; % Set the "scores" array to a trivial value which fails the below test "scores(2) > min(scores)"
    while scores(2) > min(scores),
        ms=[m-1 m m+1]; % the "ms" array the current estimate for "m" and the two adjacent values
        scores=[scoreDataTwoParam(data,ms(1),d) scoreDataTwoParam(data,ms(2),d) scoreDataTwoParam(data,ms(3),d)]; % Using the m-file "scoreData," determine the log probability of "m" given the data
        scores(find(ms<0))=max(scores)+1; % Maximize the score for ms<0 to remove negative m values
        m=ms(find(scores==min(scores))); % Set the value for "m" to the lowest of the three scores
    end

    scores=[0 1 0];
    while scores(2) > min(scores),
        ms=[m-0.1 m m+0.1];
        scores=[scoreDataTwoParam(data,ms(1),d) scoreDataTwoParam(data,ms(2),d) scoreDataTwoParam(data,ms(3),d)];
        scores(find(ms<0))=max(scores)+1; % Maximize the score for ms<0 to remove negative m values
        m=ms(find(scores==min(scores)));
    end

    scores=[0 1 0];
    while scores(2) > min(scores),
        ms=[m-0.01 m m+0.01];
        scores=[scoreDataTwoParam(data,ms(1),d) scoreDataTwoParam(data,ms(2),d) scoreDataTwoParam(data,ms(3),d)];
        scores(find(ms<0))=max(scores)+1; % Maximize the score for ms<0 to remove negative m values
        m=ms(find(scores==min(scores)));
    end

    scores=[0 1 0];
    while scores(2) > min(scores),
        ms=[m-0.001 m m+0.001];
        scores=[scoreDataTwoParam(data,ms(1),d) scoreDataTwoParam(data,ms(2),d) scoreDataTwoParam(data,ms(3),d)];
        scores(find(ms<0))=max(scores)+1; % Maximize the score for ms<0 to remove negative m values
        m=ms(find(scores==min(scores)));
    end

    scores=[0 1 0];
    while scores(2) > min(scores),
        ms=[m-0.0001 m m+0.0001];
        scores=[scoreDataTwoParam(data,ms(1),d) scoreDataTwoParam(data,ms(2),d) scoreDataTwoParam(data,ms(3),d)];
        scores(find(ms<0))=max(scores)+1; % Maximize the score for ms<0 to remove negative m values
        m=ms(find(scores==min(scores)));
    end
    
    % OPTIMIZE "d":  The two loops below optimize "d" one digit at a time.
    
    scores=[0 1 0]; % Set the "scores" array to a trivial value which fails the below test "scores(2) > min(scores)"
    while scores(2) > min(scores),
        ds=[d-.1 d d+.1]; % the "ds" array the current estimate for "d" and the two adjacent values
        ds(find(ds<0))=0.1;
        scores=[scoreDataTwoParam(data,m,ds(1)) scoreDataTwoParam(data,m,ds(2)) scoreDataTwoParam(data,m,ds(3))]; % Using the m-file "scoreDataTwoParam," determine the log probability of "m" given the data
        scores(find(ds<0))=max(scores)+1; % Maximize the score for ds<0 to remove negative d values
        d=ds(find(scores==min(scores))); % Set the value for "m" to the lowest of the three scores
    end

    scores=[0 1 0];
    while scores(2) > min(scores),
        ds=[d-.01 d d+.01];
        ds(find(ds<0))=0.01;
        scores(find(ds<0))=max(scores)+1; % Maximize the score for ds<0 to remove negative d values
        scores=[scoreDataTwoParam(data,m,ds(1)) scoreDataTwoParam(data,m,ds(2)) scoreDataTwoParam(data,m,ds(3))];
        d=ds(find(scores==min(scores)));
    end
end
    
out=[m d]; % Output the maximum likelihood values for "m" and "d"