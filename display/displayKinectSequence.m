function displayKinectSequence(sequenceData, mode)
%This function displays a Kinect sequence into a GUI. You are able to
%select what type of display is out putted
%
%Input:
%   sequenceData - sequence to display
%   mode - type of display {all, depth, rgb}
%
%Output:
%
%History:
%   Created by Daniel Leightley (dleightley@ieee.org) 03/10/2016

%Make panel for display the Kinect output
displayHandle = makeTrackingDisplay(mode);

%Global management options
global sPause; %Do we want to pause?
sPause = false;
global iIt; %Start and stop the iteration counter
iIt = true;
global i; %iteration counter
i = 1;

%Let's loop through each time step. We use the union of depth and skel to
%determine the length of our sequence
while i<=length(sequenceData.streamTimes)
    
    %If pause the display
    if sPause
        pause()             %# pauses until user press any key
    else
        sPause = false;
    end
    
    %Get the timestamp for the current time period
    timeStamp = sequenceData.streamTimes(i);

    %Display the output into our display handle
    displayKinectTime(displayHandle, sequenceData, timeStamp);

    %Output the frame number
    set(gcf,'numbertitle','off','name',['Frame ' num2str(i)]) % See the help for GCF
    
    %Draw the output at each iteration
    drawnow;
    
    %If we want to use the counter
    if iIt
        i = i+1;
    end
    
end


end


