function displayKinectTime(displayHandles, sequenceData, timeStamp)
%This function obtains the Kinect data for a specific time period and
%displays to the handle
%
%Input:
%   displayHandles - display to render
%   sequenceData - sequence information
%   timeStamp - time step to render
%
%Ouput:
%
%History:
%   Created by Daniel Leightley (dleightley@ieee.org) 03/10/2016

%Display the data at a certain time point based on Kinect
[Depth, RGB, Skels] = readKinectInstant(sequenceData, timeStamp);

%Do we want to show text output
TEXT = true;

%Do we have a skeleton. If so update the text box
if ~isempty(Skels.threeD)
    skel_text = sprintf('skeleton=true');
else
    skel_text = sprintf('skeleton=false');
end

%3D depth map display
if ~isempty(displayHandles.depthHandle)
    cla(displayHandles.depthHandle);
    surf(displayHandles.depthHandle, Depth.X, Depth.Y, Depth.Z, 'EdgeColor','None', 'FaceAlpha', 0.5);
    
    %Pass over depth text when we have a depth map
    depth_text = sprintf('depth=true');
    
    %Display when the skeleton is being tracked
    if TEXT
        text(310,10,[depth_text ' ' skel_text], 'Color', 'b', 'BackgroundColor',[.7 .9 .7], 'Parent', displayHandles.depthHandle);
    end
    
end

%3D world projection
if ~isempty(displayHandles.skelHandle)
    cla(displayHandles.skelHandle);
    if ~isempty(Skels.threeD)
        displayKinectSkeleton(displayHandles.skelHandle, Skels, 'threeD');
    end
    
end

%RGB Display
if ~isempty(displayHandles.rgbHandle)
    cla(displayHandles.rgbHandle);
    RGB = imrotate(RGB ,-90);
    RGB = flipdim(RGB,2);
    image(RGB, 'Parent',displayHandles.rgbHandle);
    if ~isempty(Skels.rgb)
        displayKinectSkeleton(displayHandles.rgbHandle, Skels, 'rgb');
    end
    
    %Display the height if we have it (if we have the skeleton)
    if TEXT
        if ~isempty(Skels.threeD)
            %Get our joint structure
            joints = getKinectJoints();
            
            %SUBJECT HEIGHT (current time period)
            height = getKinectHeight(Skels.threeD, joints);
            height = round(height*100); %the cm calculation
            text(1900,120,['Height: ' num2str(height) 'cm'], 'Color', 'b', 'BackgroundColor',[.7 .9 .7], 'Parent', displayHandles.rgbHandle);
            text(1900,40,['Time: ' num2str(timeStamp)], 'Color', 'b', 'BackgroundColor',[.7 .9 .7], 'Parent', displayHandles.rgbHandle);
                  
        end
    end
    
end

end

