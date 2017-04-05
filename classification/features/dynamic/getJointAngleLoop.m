function [A1, A2] = getJointAngleLoop(X)
%This function generates the joint angles of sequence X over time
%
%Input:
%   X - Skeleton Sequence
%
%Output:
%   A1 - Angle type 1
%   A2 - Angle type 2
%
%History:
%   Created by Dan Leightley (dleightley@ieee.org) 04/04/2017

%Generate Angle data
A1 = []; A2 = [];
joints = getKinectJoints();

for i=1:size(X,1)
    frameData = reshape(X(i,:),3, 25); %reshape the skeleton sequence
    JoI = frameData(:,joints.SpineShoulder)';
    JoR = frameData(:,joints.SpineBase)';
    J = [JoR;JoI];
    [A1(i), A2(i)] = getJointAngle(J);
end

end

