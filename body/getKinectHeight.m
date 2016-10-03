function height = getKinectHeight(skels, joints)
%This function output's predicts the height of the skeleton in real world
%coordinates
%
%Input:
%   skels - skeleton xyz locations
%   joints - joint location index
%
%Output:
%   height - the preidcted height
%
%History:
%   Created by Daniel Leightley (dleightley@ieee.org) 03/10/2016

%Get the kinect skeleton predictions
x = skels{1,3};
y = skels{1,4};
z = skels{1,5};
xyz = [x y z]';

% calculate a measure of height that can be used for normalisation:
height1 = 0;
height2 = 0;

%Predict the height
height1 = height1 + norm(xyz(:,joints.Head) - xyz(:,joints.Neck));
height1 = height1 + norm(xyz(:,joints.Neck) - xyz(:,joints.SpineShoulder));
height1 = height1 + norm(xyz(:,joints.SpineShoulder) - xyz(:,joints.SpineMid));
height1 = height1 + norm(xyz(:,joints.SpineMid) - xyz(:,joints.SpineBase));
height1 = height1 + norm(xyz(:,joints.SpineBase) - xyz(:,joints.HipRight));
height1 = height1 + norm(xyz(:,joints.HipRight) - xyz(:,joints.KneeRight));
height1 = height1 + norm(xyz(:,joints.KneeRight) - xyz(:,joints.AnkleRight));
height1 = height1 + norm(xyz(:,joints.AnkleRight) - xyz(:,joints.FootRight));

height2 = height2 + norm(xyz(:,joints.Head) - xyz(:,joints.Neck));
height2 = height2 + norm(xyz(:,joints.Neck) - xyz(:,joints.SpineShoulder));
height2 = height2 + norm(xyz(:,joints.SpineShoulder) - xyz(:,joints.SpineMid));
height2 = height2 + norm(xyz(:,joints.SpineMid) - xyz(:,joints.SpineBase));
height2 = height2 + norm(xyz(:,joints.SpineBase) - xyz(:,joints.HipLeft));
height2 = height2 + norm(xyz(:,joints.HipLeft) - xyz(:,joints.KneeLeft));
height2 = height2 + norm(xyz(:,joints.KneeLeft) - xyz(:,joints.AnkleLeft));
height2 = height2 + norm(xyz(:,joints.AnkleLeft) - xyz(:,joints.FootLeft));

heights = [height1, height2];

%Now find the average height between the left and right. 

height = mean(heights);

end


