function [X] = getSkeletonFile(S)
%This function loads in a skeleton file from our SPPB dataset. 
%
%Input:
%   S - Subject ID (see database_sppb for more)
%
%Output:
%   X - Computed action sequence
%
%History:
%   Created by Daniel Leightley (dleightley@ieee.org) 03/10/2016

%Pass the option
option = S;

%Get the file location
database_sppb

%Load

X = load([fileLoc '/skelData.mat']);


end


