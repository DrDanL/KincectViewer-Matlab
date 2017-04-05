function [V] = getStarVelocity(S,t)
%This function computes the velocity from the star skeleton features. We
%handle each joint individually. Dynamic as the CoM changes based on the
%the subject movement.
%
%Input:
%   S - Star Skeleton matrix (n x P where n is the number of features)
%   t - time delta
%
%Output:
%   V - Velocity
%
%History:
%   Created by Dan Leightley (dleightley@ieee.org) 04/04/2017

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
        
    %Add delta
    it = it+1;
    s=s+t;%Add t
    e=e+t;%Add t
end

end


