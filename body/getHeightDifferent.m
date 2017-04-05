function [diff] = getHeightDifferent(refHeight, currentHeight)
%Height difference helper function
%
%Input:
%   refHeight - computered reference height
%   currentHeight - current height timestep
%
%Output:
%   diff - height difference
%
%History:
%   Created by Dan Leightley (dleightley@ieee.org) 04/04/2017

diff = currentHeight - refHeight;

%Convert over to mm
diff = diff*100; %place with cm

end

