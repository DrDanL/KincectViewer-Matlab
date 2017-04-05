function handle = displayKinectSkeleton(ax, Skels, world)
%This function displays the Kinect skeleton depending on the world
%required. 
%
%Input:
%   ac - axis of the skeleton
%   Skels - skeleton index
%   world - type of enviorment to display
%
%Output:
%   handle - return the kinect handle 
%
%History:
%   Created by Dan Leightley (dleightley@ieee.org) 04/04/2017

%Number of joints
joints = getKinectJoints();


%Generate connections
skeleton_conn = [ ...
    %Torso
    joints.SpineBase, joints.SpineMid; ... %1
    joints.SpineMid,joints.SpineShoulder;... %2
    joints.SpineShoulder, joints.Neck;... %3
    joints.Neck,joints.Head;... %4
    
    %Left arm
    joints.SpineShoulder,joints.ShoulderLeft;... %5
    joints.ShoulderLeft, joints.ElbowLeft;... %6
    joints.ElbowLeft, joints.WristLeft;... %7
    joints.WristLeft, joints.HandLeft;... %8
    
    %Right arm
    joints.SpineShoulder, joints.ShoulderRight;... %9
    joints.ShoulderRight, joints.ElbowRight;...%10
    joints.ElbowRight, joints.WristRight;... %11
    joints.WristRight,joints.HandRight;... %12
    
    %Left leg
    joints.SpineBase, joints.HipLeft;... %13
    joints.HipLeft, joints.KneeLeft;... %14
    joints.KneeLeft,joints.AnkleLeft;... %15
    joints.AnkleLeft,joints.FootLeft;... %16
    
    %Right legs
    joints.SpineBase, joints.HipRight;... %17
    joints.HipRight, joints.KneeRight;... %18
    joints.KneeRight, joints.AnkleRight;... %19
    joints.AnkleRight, joints.FootRight; %20
    
    %Wrist
    joints.HandLeft, joints.HandTipLeft;... %21
    joints.WristLeft, joints.ThumbLeft;... %22
    
    %wrist
    joints.HandRight, joints.HandTipRight;... %23
    joints.WristRight, joints.ThumbRight;... %24
    
    ];

%Handle the different types of worlds
threeD = false;
rgb = false;
switch(world)
    case 'rgb'
        skels = Skels.rgb;
        rgb = true;
    case 'depth'
        skels = Skels.depth;
                threeD = true;

    case 'threeD'
        skels = Skels.threeD;
        threeD = true;
end


%Orignal XYZ subpolot
if rgb
    x = str2double(skels{3});
    y = str2double(skels{4});
    x(find(isnan(x))) = 0;
    y(find(isnan(y))) = 0;
else
    x = skels{3};
    y = skels{4};
end

if threeD
    z = skels{5};
else
    z = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]';
    
end

%Join the skeleton
xyz_step=[x y z];

%Plot the skeleton
handle = scatter3(ax, xyz_step(:,1), xyz_step(:,2), xyz_step(:,3), 'bo');

%Generate the limb connections

%Torso - this is fine
torsoColor = 'r';
handle = displayLimbs(ax, xyz_step', skeleton_conn(1:4,:), torsoColor, 2.5);

%Left Arm
leftArmColor = 'g';
handle = displayLimbs(ax, xyz_step', skeleton_conn(5:7,:), leftArmColor, 2.5);
handle = displayLimbs(ax, xyz_step', skeleton_conn(8:8,:), leftArmColor, 2.5);

%Right Arm
rightArmColor = 'b';
handle = displayLimbs(ax, xyz_step', skeleton_conn(9:11,:), rightArmColor, 2.5);
handle = displayLimbs(ax, xyz_step', skeleton_conn(12:12,:), rightArmColor, 2.5);

%Legs - issues with structure
leftLegColor = 'y';
rightLegColor = 'm';
handle = displayLimbs(ax, xyz_step', skeleton_conn(13:14,:), leftLegColor, 2.5);
handle = displayLimbs(ax, xyz_step', skeleton_conn(14:16,:), leftLegColor, 2.5);

handle = displayLimbs(ax, xyz_step', skeleton_conn(17:18,:), rightLegColor, 2.5);
handle = displayLimbs(ax, xyz_step', skeleton_conn(18:20,:), rightLegColor, 2.5);

%wrist
wristColor = 'r';
handle = displayLimbs(ax, xyz_step', skeleton_conn(21:21,:), wristColor, 2.5);
handle = displayLimbs(ax, xyz_step', skeleton_conn(22:22,:), wristColor, 2.5);
handle = displayLimbs(ax, xyz_step', skeleton_conn(23:23,:), wristColor, 2.5);
handle = displayLimbs(ax, xyz_step', skeleton_conn(24:24,:), wristColor, 2.5);

end


