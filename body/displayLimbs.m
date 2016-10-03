function [ handle ] = displayLimbs(ax, xyz, jointLoc, color, width)
%This function joins specific joints together with the line function.
%
%Input:
%   ax - axis location
%   xyz - the ayx location for the time instance
%   jointLoc - joint index locations
%   color - color of the lines
%   width - width of the lines
%
%Output:
%   handle - Kinect handle
%
%History:
%   Created by Daniel Leightley (dleightley@ieee.org) 03/10/2016

handle = line(xyz(1,jointLoc), xyz(2,jointLoc), xyz(3,jointLoc), 'Color', color, 'Parent', ax, 'LineWidth', width);

end

