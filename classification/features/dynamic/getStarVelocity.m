function [V] = getStarVelocity(S,t)
%This function computes the Velocity from the Star Skeleton Features. We
%handle each joint individually. Dynamic as the CoM changes based on the
%the subject movement
%Input:
%   S - Star Skeleton matrix (n x P where n is the number of features)
%   t - time delt
%
%Output:
%   V - Velocity
%
%History:
%   Created by Daniel Leightley (dleightley@ieee.org) 03/10/2016

%Cleanup and remove any NaNs
S(any(isnan(S),2),:)=[];

%Feature vector contain HandLeft, HandRight, FootLeft, FootRight
V = [];

%Compute change based on time delta t
s = 1;%Time step
e = t;%End time
it =1;% itertion
while s+t <= size(S,1)
    
    V(it,:) = abs(S(s+t,:) - S(s,:));
        
    %Add time
    it = it+1;
    s=s+t;%Add t
    e=e+t;%Add t
end


end


