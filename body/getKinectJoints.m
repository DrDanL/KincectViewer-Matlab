function joints = getKinectJoints()
%This function output's the Kinect skeleton structure when required. The
%structure relates to the index location within the skeleton file.
%
%Input:
%
%Output:
%   joints - joint structure
%
%History:
%   Created by Daniel Leightley (dleightley@ieee.org) 03/10/2016

%Joint index locations
joints.SpineBase = 1; %1:3
joints.SpineMid =2; %4:6
joints.Neck =3; %7:9
joints.Head =4; %10:12
joints.ShoulderLeft =5; 
joints.ElbowLeft =6; 
joints.WristLeft =7; 
joints.HandLeft =8; 
joints.ShoulderRight =9; 
joints.ElbowRight =10; 
joints.WristRight =11; 
joints.HandRight =12; 
joints.HipLeft =13; 
joints.KneeLeft =14; 
joints.AnkleLeft =15; 
joints.FootLeft =16; 
joints.HipRight =17; 
joints.KneeRight =18; 
joints.AnkleRight =19; 
joints.FootRight =20; 
joints.SpineShoulder =21; 
joints.HandTipLeft =22;
joints.ThumbLeft =23;
joints.HandTipRight =24;
joints.ThumbRight =25;

%The number of joints
joints.position_count = 25;


end


