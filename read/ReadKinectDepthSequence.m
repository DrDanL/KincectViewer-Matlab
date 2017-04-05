function depthSeq = ReadKinectDepthSequence(loc)
%This function read in a Kinect depth sequence from the orginal data. 
%
%Input:
%   loc - location of the root directory containing the depth map
%
%Output:
%   depthSeq - a structure containing a sequence of depth images. 
%
%History:
%   Created by Dan Leightley (dleightley@ieee.org) 04/04/2017


%Generate directory structure 
a = dir([char(loc) '*.bin']);

%Find the number of depth maps
nfiles = max(size(a));

%Generate a sequential list of file names
genFiles = {};

for i=1:nfiles
    genFiles{i} = a(i).name;
end

%Load the depth sequences into structure depthSeq
depthSeq = {};

for i=1:nfiles
   %Read in the file
   fid = fopen(genFiles{i}); %read the file in
   [A, count] = fread(fid, 'uint16=>uint16',2); %load and bitshift 
   fclose(fid); %close the stream
   
   %Convert into structure
   dims = [512 424]; %dims of the depth
   
   depth = double(A); %conver to double for imaging
   
   temp = {};
   [temp.X, temp.Y] = meshgrid([1:dims(1)], [1:dims(2)]); %obtain x and y
   temp.Z = reshape(depth, dims(1), dims(2))'; %generate depth
   %Play around with this. You may find the outcome interesting
   %temp.Z(temp.Z==0)=NaN; % noise clean up
   depthSeq{i} = temp;
end

end
