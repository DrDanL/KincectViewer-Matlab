function [absDist] = getAbsChange(X, t)
%This function computes the absolute distance different between each joint
%over time.
%
%Input:
%   X - Skeleton matrix (n x P where n is time)
%   t - time delta
%
%Output:
%   absS - Change over time
%
%History:
%   Created by Dan Leightley (dleightley@ieee.org) 04/04/2017

%Cleanup and remove any NaNs
X(any(isnan(X),2),:)=[];

%Compute change based on time delta t
s = 1;  %Time step start
e = t;  %End time
it =1;  % iteration

%TODO initalise in memory absDist 

while e+t <= size(X,1)
    
    dM= []; %Hold distances
    sPoint = 1;
    for i=1:25 %for each joint
        dM(i) = absDistance(X(s, sPoint:sPoint+2), X(s+t,sPoint:sPoint+2));
        sPoint = sPoint+ 3;
    end
    absDist(it,:) = dM;
    
    %Add time
    it = it+1;
    s=s+t;%Add delta
    e=e+t;%Add delta
    
end

end


