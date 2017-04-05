function [outputClass]=normalizeMnMx(superClass,par1,par2)
%A function to normalise the input (superClass) to be within the region of
%par1 and par2
%
%Input:-
%   superClass - The N set of datapoints
%   par1 - lowest value
%   par2 - highest value
%
%Output:-
%   outputClass - normalised data
%
%History:-
%   Created by Dan Leightley (dleightley@ieee.org) 04/04/2017


%Loop through super class and normalise the data
for j=1:size(superClass,2)
    
    %The current minimum of superClass on row j
    theMin=min(superClass(:,j));
    %The current maximum of superClass on row j
    theMax=max(superClass(:,j));
    
    %Perform normalisation of all values on row j to be within the region
    %of par1 and par2
    superClass(:,j)=par1+((par2-par1)*(superClass(:,j)-theMin))/(theMax-theMin);
end

%Return the output
outputClass = superClass;
