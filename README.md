# FluctuationTest_GregLang
These are the MATLAB scripts used for analysis of the fluctuation tests used to measure the mutation rate of S. cerevisiae as described in Lang and Murray, Genetics 2008

## findMLm
Input: data from fluctuation assay.
Output: most likely value of m given the data. Command: findMLm(data)
This program requires the following programs to run: scoreData, generateLD.

## findMLmTwoParam
Input: data from fluctuation assay.
Output: most likely values of m and d given the data. Command: findMLmTwoParameter(data)
This program requires the following programs to run: scoreDataTwoParam, generateLD, generatePO, generateTwoParam.

## scoreData
Input: data from fluctuation assay and m.
Output: -log probability of observing the data given m. Command: scoreData(data, m)
This program requires the following program to run: generateLD.

## scoreDataTwoParam
Input: data from fluctuation assay, m, and d.
Output: -log probability of observing data given m and d. Command: scoreDataTwoParam(data, m, d)
This program requires the following programs to run: generateLD, generatePO, generateTwoParam.

## generateLD
Input: m, and max.
Output: The Luria-Delbrück distribution from 0 to max with parameter m. Command: generateLD(m, max)

## generatePO
Input: lambda, and max.
Output: The Poisson distribution from 0 to max with parameter lambda. Command: generatePO(lambda, max)

## generateTwoParam
Input: m, d, and max.
Output: The combined Luria-Delbrück and Poisson distribution from 0 to
max with parameters m and lambda = m x d. Command: generateTwoParam(m, d, max)
This program requires the following programs to run: generateLD, generatePO.

## sampleLD
Input: m, number of samples.
Output: Random variables from the Luria-Delbrück distribution with
parameter m. Command: sampleLD(m, samples)
This program requires the following program to run: generateLD.

## sampleTwoParam
Input: m, number of samples.
Output: Random variables from a combined Luria-Delbrück and Poisson
distribution with parameters m and lambda = m x d. Command: sampleTwoParam(m, d, samples)
This program requires the following programs to run: generateLD, generatePO, generateTwoParam.

## SSDScoreLD
Input: data from fluctuation assay.
Output: sum of the squared differences between the cumulative distribution
of the data and the cumulative Luria-Delbrück distribution with
parameter m determined from the data. Command: SSDScore(data)
This program requires the following programs to run: findMLm, scoreData, generateLD.

## SSDScoreTwoParam
Input: data from fluctuation assay.
Output: sum of the squared differences between the cumulative distribution
of the data and the cumulative combined Luria-Delbrück and Poisson distribution with parameters m and lambda = m x d determined from the data.
Command: SSDScoreTwoParam(data)
This program requires the following programs to run: findMLmTwoParam, scoreDataTwoParam, generateLD, generatePO, generateTwoParam.
