function Skels =  readKinectSkeletonIndid(loc)
%This function reads in a single skeleton kinect file.
%
%Input:
%   loc - location of the skeleton file
%
%Output:
%   Skels - the skeleton at the specific time instance
%
%History:
%   Created by Dan Leightley (dleightley@ieee.org) 04/04/2017

%Read in the skeleton
fid = fopen(loc); %read the file in
C = textscan(fid, '%s%s%f%f%f%s%s');
fclose(fid);

%Bit shift the skeleton z component for player mask
% C{8} = bitshift(C{8}, -3);


%RGB coordinate locations from the skeleton text file
myindex = 1;
for j = [1,2,6,7]
    Skels.rgb{1,myindex} = C{j};
    myindex = myindex +1;
end


%Joint cords for 3d world
myindex = 1;
for j = [1,2,3,4,5]
    Skels.threeD{1,myindex} = C{j};
    myindex = myindex +1;
end

%joint cords in the depth space
myindex = 1;
for j = [1,2,3,4,5]
    Skels.depth{1,myindex} = C{j};
    myindex = myindex +1;
end


end


