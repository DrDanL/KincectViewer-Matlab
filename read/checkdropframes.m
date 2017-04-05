function checkdropframes(fileLoc)
%This function determines the FPS for a kinect sequence. Further, it
%determines the FPS for each data stream. 
%
%Input:
%   fileLoc - file location of the master directory
%
%Output:
%   fprintf - print statment to screen. 
%
%History:
%   Created by Dan Leightley (dleightley@ieee.org) 04/04/2017

%Get the Kinect timestamp sequence
sequenceData = ReadSequence(fileLoc);

%depth
depth = sequenceData.depthTimes; %Get the times
depthDrop = (depth(end)/10000000) - (depth(1)/10000000); %length of time
labelsDepth = ones(size(depth,1),1)*1;

%colour
colour = sequenceData.rgbTimes;
colourDrop = (colour(end)/10000000) - (colour(1)/10000000);
labelsColour = ones(size(colour,1),1)*2;

%skel
skel = sequenceData.skelTimes;
skelDrop = (skel(end)/10000000) - (skel(1)/10000000);
labelsSkel = ones(size(skel,1),1)*3;

fprintf('Depth: %d Colour: %d Skel: %d \n', (size(depth,1)/depthDrop), (size(colour,1)/colourDrop), (size(skel,1)/skelDrop));

%join it all together
allData = [depth,labelsDepth;colour,labelsColour; skel,labelsSkel];
[~, o] = sort(allData(:,1));
plotData = [allData(o,1),allData(o,2)];

typeIn = [0,1; 1,2; 2,3];
col = [ .1, .2, .4; .2, .5, .5; .7,.8,.2;];

for i=1:size(plotData,1)
    line([i i], [typeIn(plotData(i,2),1), typeIn(plotData(i,2),2)], 'Color', col(plotData(i,2),:));
    hold on
end
xlabel('Frames')
ylabel('Recorded')
set(gca, 'ytick', [])
legend('Depth ', 'Colour', 'Skeleton')
end
