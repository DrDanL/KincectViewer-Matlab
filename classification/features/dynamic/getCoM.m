function [C, V] = getCoM(X,t)
%This function computes the centre of mass over time. CoM is computed based
%on the hip location and spine mid.
%
%Input:
%   X - Skeleton matrix (n x P where n is time)
%   t - time delta
%
%Output:
%   C - Centre of Mass
%   V - Change over time
%
%History:
%   Created by Daniel Leightley (dleightley@ieee.org) 03/10/2016


C = []; %Store CoM for each time period

%Loop through each timestamp and generate CoM
for i=1: size(X,1)
    
    %Joints of interest
    J1 = X(i,1:3);%SpineMid
    J2 = X(i,37:39 );%HipLeft
    J3 = X(i,34:36);%HipRight
    
    %Joint all the joints together
    AllJ = [J1; J2; J3];
    %Find the mean all these joints
    C(i,:) = mean(AllJ);
    
end

%Cleanup and remove any NaNs
C(any(isnan(C),2),:)=[];

V = [];
%Compute change based on time delta t
s = 1;%Time step
e = t;%End time
it =1;% itertion
while e+t <= size(C,1)
    
    %Obtain two timestamps
    T1 = C(s,:);
    T2 = C(s+t,:);
    
    %Determine the absolute distance
    V(it,:) = absDistance(T2, T1);
    
    %Add time
    it = it+1;
    s=s+t;%Add t
    e=e+t;%Add t
    
end

end


