function refHeight = getHeightReference(sequenceData, refPoint)
%This function computes the reference height for a subject. We are
%interested in finding the average standing height. We are then able to
%determine if they are increasing (aka jumping) or decreasing (aka
%bending/sitting down). 
%
%Input:
%   sequenceData - sequence information
%   refPoint - reference point to extract
%
%Output:
%   refHeight - compute height
%   
%History:
%   Created by Dan Leightley (dleightley@ieee.org) 04/04/2017

Skels = readKinectSkeletonIndid([sequenceData.name '/skel/' num2str(refPoint) '.txt'  ]);

%You could do some fancy height computation here. In previous work, we have
%utilised a normatived height over a period delta with a bandwidth filter
%to handle noise. 

%We select the first frame (Spine) and extract the y axis information
refHeight = Skels.threeD{4}(2);

end


