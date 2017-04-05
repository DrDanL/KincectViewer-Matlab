function [D] = absDistance(P1, P2)
%This function computes the absolute Euclidean distance between P1 and P2. 
%Where P = {x, y, z}
%
%Input:
%   P1 - XYZ1
%   P2 - XYZ2
%
%Ouput:
%   D - Absolute distance
%
%History:
%   Created by Dan Leightley (dleightley@ieee.org) 04/04/2017
 
xd = P2(1) - P1(1);
yd = P2(2) - P1(2);
zd = P2(3) - P1(3);
 
D = sqrt(xd*xd + yd*yd + zd*zd);
 
end
 

