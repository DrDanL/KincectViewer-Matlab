function [change] = getMChange(X, t)
%This function computes the mean of the input sequence X (for each joint) and computes the
%change for each joint - using absolute distance over time delta.
%
%Input:
%   X - Skeleton matrix (n x P where n is time)
%   t - time delta
%
%Output:
%   C - Change over time
%
%History:
%   Created by Dan Leightley (dleightley@ieee.org) 04/04/2017

%Cleanup and remove any NaNs
X(any(isnan(X),2),:)=[];

mn = mean(X); %Obtain the mean representation

%Compute change based on time delta t
s = 1;%Time step start
e = t;%End time
it =1;% itertion

while e <= size(X,1)
    
    dM= []; %Hold distances
    sPoint = 1;
    for i=1:25 %for each joint
        dM(i) = absDistance(mn(sPoint:sPoint+2), X(s,sPoint:sPoint+2));
        sPoint = sPoint+ 3;
    end
    change(it,:) = dM;
    
    %Add time
    it = it+1;
    s=s+t;%Add delta
    e=e+t;%Add delta
    
end

end


