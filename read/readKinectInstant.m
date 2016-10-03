function [Depth, RGB, Skels] = readKinectInstant(sequenceData, timestamp)
%Reads in the specific depth streams required for rending our sequence.
%
%Input:
%   sequenceData - sequence information
%   timeStamp - time step to render
%
%Output:
%   Depth - depth image
%   RGB - RGB image
%   Skels - skeleton structure
%
%History:
%   Created by Daniel Leightley (dleightley@ieee.org) 03/10/2016


if ~isempty(sequenceData.depthTimes)
    
    %Load depth data
    timedifRGB = double(sequenceData.depthTimes) - double(timestamp);
    [~, closestTimeStamp] = min(abs(timedifRGB));
    
    %Commented below as we're using file paths
    Depth = ReadKiectDepthIndivi([sequenceData.name '/depth/depth' num2str(sequenceData.depthTimes(closestTimeStamp)) '.bin'  ]);
    
else
    Depth = [];
end

if ~isempty(sequenceData.rgbTimes)
    %Find the nearest image in time
    timeDifRGB = double(sequenceData.rgbTimes) - double(timestamp);
    [~, closestTimeStamp] = min(abs(timeDifRGB));
    
    RGB = ReadKinectRGBIndvid([sequenceData.name '/rgb/image' num2str(sequenceData.rgbTimes(closestTimeStamp)) '.bin'  ]);
    
else
    RGB = [];
end
%Read in the skeletons

%Option 1: Find the closest timestamps
%timedifSkel = double(sequenceData.skelTimes) - double(timestamp);
%[~, closestTimeStamp] = min(abs(timedifSkel));

%Option 2: Require timestamps to match
skelLoc = find(sequenceData.skelTimes == timestamp);

if ~isempty(skelLoc)
    Skels = readKinectSkeletonIndid([sequenceData.name '/skel/' num2str(sequenceData.skelTimes(skelLoc)) '.txt'  ]);
    
else
    Skels.threeD =[];
    Skels. rgb = [];
end


end


