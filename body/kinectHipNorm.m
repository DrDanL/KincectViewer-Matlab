function [N] = kinectHipNorm(X)
%A function to normalise all joints in the sequence to the hip joint of the
%first frame(1,1:3)
%Input:-
%   X - Matrix to be normalised
%Output:-
%   N = normalised data to the hip centre of the first frame
%History:-
%   Created by Daniel Leightley (dleightley@ieee.org) 03/10/2016

X(any(isnan(X),2),:)=[];

%Obtain the first frame hip centre joint information
ffHC = [X(1,1), X(1,2), X(1,3)];

%Repeat the data in matrix that represents the orginal size
%Division used to account for the repmat of 3 cells.
repeatCentre = repmat(ffHC, [1 size(X, 2)/3]);

%Now create the N of the matrix to match the original hipSeq
repeatCentre = repmat(repeatCentre, [size(X, 1) 1]);

%Subtract the repeatCentre (the first frame HipCenter XYZ) from all
%other values to result in a normalised N.
N = X - repeatCentre;

end


