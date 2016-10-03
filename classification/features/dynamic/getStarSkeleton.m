function [S] = getStarSkeleton(X,COM)
%This function determines the distance from the CoM to each joint using
%absolute Euclidean distance (for each time period). The function provides 
%the delta statistic for for the feature vector.Dynamic as the CoM changes
%based on the the subject movement
%
%Input:
%   X - Skeleton matrix (n x P where n is time)
%   COM - Centre of Mass
%
%Output:
%   S - Star Skeleton Representation
%
%History:
%   Created by Daniel Leightley (dleightley@ieee.org) 03/10/2016


%Cleanup and remove any NaNs
X(any(isnan(X),2),:)=[];

%Feature vector contain HandLeft, HandRight, FootLeft, FootRight
S = [];

%Compute change based on time delta t
s = 1;%Time step
while s <= size(X,1)
        
    dM= []; %Hold distances
    sPoint = 1;
    for i=1:25 %for each joint
        dM(i) = absDistance(COM(s,:), X(s,sPoint:sPoint+2));
        sPoint = sPoint+ 3;
    end
    
    S(s,:) = dM;
    
    s=s+1;%Add t
end


end


