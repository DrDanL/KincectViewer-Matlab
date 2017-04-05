function [depthImg] = ReadKiectDepthIndivi(loc)
%This function read's in a Kinect depth image from a bin file
%
%Input:
%   loc - location of the bin file
%Ouput:
%   depthImg - depth image
%History:
%   Created by Dan Leightley (dleightley@ieee.org) 04/04/2017

%Read in the file
fid = fopen(loc); %read the file in
[A, count] = fread(fid, 'uint16=>uint16',2); %load and bitshift
fclose(fid); %close the stream

%Convert into structure
dims = [512 424]; %dims of the depth

depth = double(A); %conver to double for imaging

[depthImg.X, depthImg.Y] = meshgrid([1:dims(1)], [1:dims(2)]); %obtain x and y
depthImg.Z = reshape(depth, dims(1), dims(2))'; %generate depth
%Toggle this to see the results
%temp.Z(temp.Z==0)=NaN; % noise clean up

end

