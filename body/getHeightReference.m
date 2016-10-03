function refHeight = getHeightReference(sequenceData, refPoint)
%This function computes the reference height for a subject. We are
%interested in finding their average standing height. We are then able to
%determine if they are increasing (aka jumping) or decreasing (aka
%bending). 
%
%Input:
%   sequenceData - sequence information
%   refPoint - reference point to extract
%
%Output:
%   refHeight - compute height
%   
%History:
%   Created by Daniel Leightley (dleightley@ieee.org) 03/10/2016

%Commented out due to we're loading absolute path
Skels = readKinectSkeletonIndid([sequenceData.name '/skel/' num2str(refPoint) '.txt'  ]);

%We select the first frame (Spine) and extract the y axis information
refHeight = Skels.threeD{4}(2);

end


