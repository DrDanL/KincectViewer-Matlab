function [rgbImg] = ReadKinectRGBIndvid(loc)
%This function read's in a Kinect RGB image from a bin file
%
%Input:
%   loc - location of the bin file
%
%Output:
%   depthImg - depth image
%
%History:
%   Created by Daniel Leightley (dleightley@ieee.org) 03/10/2016

%Read in the image file
fid = fopen(loc);
[A, count] = fread(fid, 'uint8=>uint8');
fclose(fid);

dims = [1920 1080];
rgbImg(:,:,3) = reshape(A(1:4:end), dims(1), dims(2));
rgbImg(:,:,2) = reshape(A(2:4:end), dims(1), dims(2));
rgbImg(:,:,1) = reshape(A(3:4:end), dims(1), dims(2));

imageRGB = permute(rgbImg, [2 1 3]);

end


