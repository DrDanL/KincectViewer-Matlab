function [Z] = getFunctionZone(X)
%This function estimates the maximum movement zone of X. Based on this we are able
%to estimate the amount of movement and in which zone the perform performs
%that movement as an indicator of stability. 
%
%Input:
%   X - Action Sequence
%
%Output:
%   Z - Total Area Covered
%
%History:
%   Created by Dan Leightley (dleightley@ieee.org) 04/04/2017

%Minimum and maximum distances
xMin = min(X);
xMax = max(X);

%Find the different between the two
eachJoint = abs(xMin - xMax);

Z = sum(eachJoint);

end

