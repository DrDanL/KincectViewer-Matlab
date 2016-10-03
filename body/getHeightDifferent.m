function [diff] = getHeightDifferent(refHeight, currentHeight )
%This function determines the height different between the refHeight (our
%reference point) and currentHeight (current time instance)
%
%Input:
%   refHeight - computered reference height
%   currentHeight - current height timestep
%
%Output:
%   diff - height difference
%
%History:
%   Created by Daniel Leightley (dleightley@ieee.org) 03/10/2016

diff = currentHeight - refHeight;

%Convert over to mm
diff = diff*100; %changed from round

end

