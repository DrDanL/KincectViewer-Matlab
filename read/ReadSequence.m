function sequenceData = ReadSequence(subject)
%This function read's in the sequence and compiles a data structure of
%timestamps and other data needed to compile the sequence
%
%Input:
%   subject - subject's to read in
%
%Output:
%   sequenceData - contains the sequence data for the subject/action
%
%History:
%   Created by Daniel Leightley (dleightley@ieee.org) 03/10/2016

%Initialize
sequenceData = {};

%Pass over the subject name (otherwise the file location)
sequenceData.name = subject;

%Read in timestamps for each sequence stream
dirLoc = subject;

%Read in the time stamps for each data stream
sequenceData.depthTimes = ReadTimeStamps([dirLoc '/time_depth.txt']);
sequenceData.skelTimes = ReadTimeStamps([dirLoc '/time_skel.txt']);
sequenceData.rgbTimes = ReadTimeStamps([dirLoc '/time_rgb.txt']);

%Find the unique timestamps for both skel and depth. Ensure no errors are
%occurring.
if ~isempty(sequenceData.depthTimes)
    
    [depthTimesUnique, idepth] = unique(sequenceData.depthTimes);
    sequenceData.depthTimes = depthTimesUnique;
    [skelUnique, iskel] = unique(sequenceData.skelTimes);
    sequenceData.skelTimes = skelUnique;
    
    %Find timestamps that are in common. This means that we will always have a
    %skeleton for each depth image.
    %sequenceData.streamTimes = union(sequenceData.depthTimes,sequenceData.skelTimes);
    
    %Due to problems with the latest version of kinect we have to do this
    %manually per depth frame.
    sequenceData.streamTimes = sequenceData.skelTimes;
    
end

end
