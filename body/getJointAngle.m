function [A1, A2] = getJointAngle(J)
%This function computes the joint angle between two input vectors. 
%
%Input:
%   J - The joint vector 1 [XX, YY, ZZ; XX, YY, ZZ]
%
%Output:
%   A2 - ATAN DOT Angle Degrees
%
%History:
%   Created by Daniel Leightley (dleightley@ieee.org) 03/10/2016


%Angle method 1
p1 = J(1,:);
p2 = J(2,:);
p1(1,3) = p1(1,3)- p2(1,3);
p2(1,3) = p1(1,3)- p2(1,3);

% With origin as the reference point, the angle between vectors is 0
A1 = rad2deg(atan2(norm(cross(p1,p2)),dot(p1,p2)));

%Angle method 2
xx = J(1,1) - J(2,1);
yy = abs(J(1,2) - J(2,2));
zz = J(1,3) - J(2,3);

h = yy;

l = sqrt((xx*xx) + (yy*yy) + (zz*zz));

sinV = asin(h/l);

A2 = 180*sinV/pi;

end


