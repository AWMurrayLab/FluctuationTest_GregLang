% generateTwoParam; Last updated on 1/8/07; 
% Greg Lang; Harvard University

% This script generates a Luria-Delbruck distribution overlaid with a
% Poisson, simulating the effect of post-plating growth on the
% Luria-Delbruck distribution.

% Any cultures with more than "max" colonies are lumped into the "max" group.

function out=generateTwoParam(m,d,max); % Import "m" and "d" from user

LD=generateLD(m,max); % Generate a Luria-Delbruck distribution with parameter "m" up to "max".
PO=generatePO(m*d,max); % Generate the Poisson distribution with parameter "lambda" = "m*d" up to "max".
PO(find(isnan(PO)==1))=0; % This line of code finds all values in the Poisson dist that are so small that they register as NaN ("Not a Number") and sets them to 0.
coDist=[]; % Create an empty array "coDist".

% The loop below calculates the probability distribution for the combined
% Luria-Delbruck/Poisson.  
for i=[0:max],
    coDist=[coDist, dot(LD(1:i+1),fliplr(PO(1:i+1)))];
end;
    
out = coDist; % Output the array "coDist"