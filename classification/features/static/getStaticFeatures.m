function [output] = getStaticFeatures(X)
%This function generates a set of static features. These features should be
%constant over time. These features should highlight where a skeleton is
%incorrectly formed. Playing around with possible features. 
%
%Input:
%   X - skeleton matrix (m * n) where n is time (ensure nans are removed)
%
%Output:
%   S - Static feature list (m * n)
%
%History:
%   Created by Dan Leightley (dleightley@ieee.org) 04/04/2017

%Setup
output = [];
joints = getKinectJoints(); %Generate joint structure

%Loop through each frame and generate our features of interest
for i=1:size(X,1)
    
    %Reshape the data to an acceptable format
    frameData = reshape(X(i,:),3, 25); %reshape the skeleton sequence
    frameData = frameData'; %Transpose to the right way
    skel{1} = []; skel{2} = []; skel{3} = frameData(:,1); %The threeD projection
    skel{4} = frameData(:,2);skel{5} = frameData(:,3); %The threeD projection
    
    % STATIC FEATURE COMPUTION
    
    %1. Height - The subjects height per frame (averge of left and right)
    height = getKinectHeight(skel, joints);
    
    %Format - Transpose back
    xyz = frameData';
    
    %2. Length Torso (Head, Neck, SpineMid and SpineBase)
    torsoL = 0;
    torsoL = torsoL + norm(xyz(:,joints.Head) - xyz(:,joints.Neck));
    torsoL = torsoL + norm(xyz(:,joints.Neck) - xyz(:,joints.SpineShoulder));
    torsoL = torsoL + norm(xyz(:,joints.SpineShoulder) - xyz(:,joints.SpineMid));
    torsoL = torsoL + norm(xyz(:,joints.SpineMid) - xyz(:,joints.SpineBase));
    
    %3. Length Left Leg
    lLeg = 0;
    lLeg = lLeg + norm(xyz(:,joints.SpineBase) - xyz(:,joints.HipLeft));
    lLeg = lLeg + norm(xyz(:,joints.HipLeft) - xyz(:,joints.KneeLeft));
    lLeg = lLeg + norm(xyz(:,joints.KneeLeft) - xyz(:,joints.AnkleLeft));
    lLeg = lLeg + norm(xyz(:,joints.AnkleLeft) - xyz(:,joints.FootLeft));
    
    %4. Length Right Leg
    rLeg = 0;
    rLeg = rLeg + norm(xyz(:,joints.SpineBase) - xyz(:,joints.HipRight));
    rLeg = rLeg + norm(xyz(:,joints.HipRight) - xyz(:,joints.KneeRight));
    rLeg = rLeg + norm(xyz(:,joints.KneeRight) - xyz(:,joints.AnkleRight));
    rLeg = rLeg + norm(xyz(:,joints.AnkleRight) - xyz(:,joints.FootRight));
    
    %5. Length Lower Left Leg
    lowLleg = 0;
    lowLleg = lowLleg + norm(xyz(:,joints.KneeLeft) - xyz(:,joints.AnkleLeft));
    lowLleg = lowLleg + norm(xyz(:,joints.AnkleLeft) - xyz(:,joints.FootLeft));
    
    %6. Length Lower Right Leg
    lowRleg = 0;
    lowRleg = lowRleg + norm(xyz(:,joints.KneeRight) - xyz(:,joints.AnkleRight));
    lowRleg = lowRleg + norm(xyz(:,joints.AnkleRight) - xyz(:,joints.FootRight));
    
    %7. Theigh Left Leg
    teLleg = 0;
    teLleg = teLleg + norm(xyz(:,joints.SpineBase) - xyz(:,joints.HipLeft));
    teLleg = teLleg + norm(xyz(:,joints.HipLeft) - xyz(:,joints.KneeLeft));
    
    %8. Theigh Right Leg
    teRleg = 0;
    teRleg = teRleg + norm(xyz(:,joints.SpineBase) - xyz(:,joints.HipRight));
    teRleg = teRleg + norm(xyz(:,joints.HipRight) - xyz(:,joints.KneeRight));
    
    %9. Length Left Arm - Upper
    upLeftArm = 0;
    upLeftArm = upLeftArm + norm(xyz(:,joints.SpineShoulder) - xyz(:,joints.ShoulderLeft));
    upLeftArm = upLeftArm + norm(xyz(:,joints.ShoulderLeft) - xyz(:,joints.ElbowLeft));
    
    %10. Length Right Arm - Upper
    upRightArm = 0;
    upRightArm = upRightArm + norm(xyz(:,joints.SpineShoulder) - xyz(:,joints.ShoulderRight));
    upRightArm = upRightArm + norm(xyz(:,joints.ShoulderRight) - xyz(:,joints.ElbowRight));
    
    %11. Length Left Arm - Lower
    lowLeftArm = 0;
    lowLeftArm = lowLeftArm + norm(xyz(:,joints.ElbowLeft) - xyz(:,joints.WristLeft));
    lowLeftArm = lowLeftArm + norm(xyz(:,joints.WristLeft) - xyz(:,joints.HandLeft));
    
    %12. Length Right Arm - Lower
    lowRighttArm = 0;
    lowRighttArm = lowRighttArm + norm(xyz(:,joints.ElbowRight) - xyz(:,joints.WristRight));
    lowRighttArm = lowRighttArm + norm(xyz(:,joints.WristRight) - xyz(:,joints.HandRight));
    
    %13. Length Shulder Spane
    shoLen = 0;
    shoLen = shoLen + norm(xyz(:,joints.ShoulderLeft) - xyz(:,joints.SpineShoulder));
    shoLen = shoLen + norm(xyz(:,joints.SpineShoulder) - xyz(:,joints.ShoulderRight));
    
    % FEATURE VECTOR FORM
    %These feature vector for each time period. 
    output(i,:) = [height, torsoL, lLeg, rLeg, lowLleg, lowRleg, teLleg, teRleg, upLeftArm, upRightArm,lowLeftArm, lowRighttArm, shoLen ];
    
end

end


