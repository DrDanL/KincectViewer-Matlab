function [absS] = getAbsChange(X, t)
%This function computes the absolute distance different between each joint
%over time. We compare handt1 to handt2. 
%
%Input:
%   X - Skeleton matrix (n x P where n is time)
%   t - time delta
%
%Output:
%   absS - Change over time
%
%History:
%   Created by Daniel Leightley (dleightley@ieee.org) 03/10/2016

%Cleanup and remove any NaNs
X(any(isnan(X),2),:)=[];

%Compute change based on time delta t
s = 1;%Time step start
e = t;%End time
it =1;% iteration
while e+t <= size(X,1)
    
    dM= []; %Hold distances
    sPoint = 1;
    for i=1:25 %for each joint
        dM(i) = absDistance(X(s, sPoint:sPoint+2), X(s+t,sPoint:sPoint+2));
        sPoint = sPoint+ 3;
    end
    absS(it,:) = dM;
    
    %Add time
    it = it+1;
    s=s+t;%Add t
    e=e+t;%Add t
    
end


end


