function [displayHandles] = makeTrackingDisplay(disMode)
%This function generates the window handle for displaying the Kinect
%output. A user passes in a parameter disMode to select the mode they want
%to display.
%
%Input:
%   disMode - mode to display
%
%Ouput:
%   displayHandles - display handle for the selected mode
%
%History:
%   Created by Dan Leightley (dleightley@ieee.org) 04/04/2017

%Clear the handles and initialise
displayHandles.depthHandle = [];
displayHandles.skelHandle = [];
displayHandles.rgbHandle = [];
displayHandles.shouterHandle = [];

%Switch for different display modes
switch disMode
    case 'all'
        figure('KeyPressFcn',@KeyPressFcn);
        menuSetup
        % Resize the figure. Figure 'Position' is [left bottom width
        % height] and the display ratio is 4:3 and there are 3 images:
        my_pos = get(gcf, 'Position');
        my_pos(1) = 50;
        my_pos(4) = 300;
        my_pos(3) = my_pos(4) * (12/3);
        set(gcf, 'Position', my_pos);
        
        % for rotation to get behind Kinect:
        az = 180; el = -90;
        
        % For manual axes creation: [left bottom width height]
        % Notes: "axis vis3d freezes aspect ratio properties to enable
        % rotation of 3-D objects and overrides stretch-to-fill."
        
        % handle to where we plot the depth data:
        displayHandles.depthHandle = axes('position', [0.01 0.01 0.31 0.98]);
        axis(displayHandles.depthHandle, [0 512 0 424 0 70000], 'ij'); % set axes limits and image plotting (ij)
        set(displayHandles.depthHandle, 'Color', 'k', 'XTick', [], 'YTick', [], 'ZTick', []); % set background colour and turn axes labels off
        view(displayHandles.depthHandle, [az el]); % set viewpoint
        hold(displayHandles.depthHandle, 'on'); % hold (last)
        
        % handle to where we plot the 3D skeleton:
        displayHandles.skelHandle = axes('position', [0.33 0.01 0.31 0.98]);
        axis(displayHandles.skelHandle, [-2 2 -1.5 1.5 0.85 4], 'equal'); % set axes limits
        set(displayHandles.skelHandle, 'Color', 'k', 'XTick', [], 'YTick', [], 'ZTick', []); % set background colour
        view(displayHandles.skelHandle, [az el]); % set viewpoint
        hold(displayHandles.skelHandle, 'on'); % hold (last)
        
        % handle to where we plot the RGB images:
        displayHandles.rgbHandle = axes('position', [0.65 0.01 0.31 0.98]);
        axis(displayHandles.rgbHandle, 'ij', 'equal', 'off');
        % The following is a quick fix for the left-right RGB image flip...
        % But I think something really needs fixing elsewhere:
        set(displayHandles.rgbHandle, 'XDir', 'reverse');
        hold(displayHandles.rgbHandle, 'on'); % hold (last)
        axes(displayHandles.skelHandle);
        
        
    case 'rgb'
        figure('KeyPressFcn',@KeyPressFcn);
        
        % Resize the figure. Figure 'Position' is [left bottom width
        % height] and the display ratio is 4:3 and there are 3 images:
        my_pos = get(gcf, 'Position');
        my_pos(1) = 50;
        my_pos(4) = 300;
        my_pos(3) = my_pos(4) * (12/3);
        set(gcf, 'Position', my_pos);
        
        % handle to where we plot the RGB images:
        displayHandles.rgbHandle = axes('position', [0.01 0.01 0.98 0.98]);
        axis(displayHandles.rgbHandle, 'ij', 'equal', 'off');
        % The following is a quick fix for the left-right RGB image flip...
        % But I think something really needs fixing elsewhere:
        set(displayHandles.rgbHandle, 'XDir', 'reverse');
        hold(displayHandles.rgbHandle, 'on'); % hold (last)
        
    case 'depth'
        figure('KeyPressFcn',@KeyPressFcn);
        
        % Resize the figure. Figure 'Position' is [left bottom width
        % height] and the display ratio is 4:3 and there are 3 images:
        my_pos = get(gcf, 'Position');
        my_pos(1) = 100;
        my_pos(2) = 200;
        my_pos(4) = 500;
        my_pos(3) = 600;
        
        set(gcf, 'Position', my_pos);
        
        % for rotation to get behind Kinect:
        az = 180; el = -90;
        
        % handle to where we plot the depth data:
        displayHandles.depthHandle = axes('position', [0.01 0.01 1 1]);
        axis(displayHandles.depthHandle, [0 512 0 424 0 70000], 'ij', 'vis3d'); % set axes limits and image plotting (ij)
        set(displayHandles.depthHandle, 'Color', 'k', 'XTick', [], 'YTick', [], 'ZTick', []); % set background colour and turn axes labels off
        view(displayHandles.depthHandle, [az el]); % set viewpoint
        hold(displayHandles.depthHandle, 'on'); % hold (last)
        
    case 'skel'
        figure('KeyPressFcn',@KeyPressFcn);
        
        % Resize the figure. Figure 'Position' is [left bottom width
        % height] and the display ratio is 4:3 and there are 3 images:
        my_pos = get(gcf, 'Position');
        my_pos(1) = 100;
        my_pos(2) = 200;
        my_pos(4) = 500;
        my_pos(3) = 600;
        set(gcf, 'Position', my_pos);
        
        % for rotation to get behind Kinect:
        az = 180; el = -90;
        
        % handle to where we plot the 3D skeleton:
        displayHandles.skelHandle = axes('position', [0.01 0.01 0.98 0.98]);
        axis(displayHandles.skelHandle, [-2 2 -1.5 1.5 0.85 4], 'equal'); % set axes limits
        set(displayHandles.skelHandle, 'Color', 'k', 'XTick', [], 'YTick', [], 'ZTick', []); % set background colour
        view(displayHandles.skelHandle, [az el]); % set viewpoint
        hold(displayHandles.skelHandle, 'on'); % hold (last)
        
        %multi skels
    case 'skels2'
        figure;
        % Resize the figure. Figure 'Position' is [left bottom width
        % height] and the display ratio is 4:3 and there are 3 images:
        my_pos = get(gcf, 'Position');
        my_pos(1) = 50;
        my_pos(4) = 300;
        my_pos(3) = my_pos(4) * (12/3);
        set(gcf, 'Position', my_pos);
        
        % for rotation to get behind Kinect:
        az = 180; el = -90;
        
        % handle to where we plot the 3D skeleton:
        displayHandles.skelHandle = axes('position', [0.10 0.01 0.50 0.98]);
        axis(displayHandles.skelHandle, [-2 2 -1.5 1.5 0.85 4], 'equal'); % set axes limits
        set(displayHandles.skelHandle, 'Color', 'k', 'XTick', [], 'YTick', [], 'ZTick', []); % set background colour
        view(displayHandles.skelHandle, [az el]); % set viewpoint
        hold(displayHandles.skelHandle, 'on'); % hold (last)
        
        % handle to where we plot the 3D skeleton:
        displayHandles.skelHandle2 = axes('position', [0.33 0.01 0.51 0.98]);
        axis(displayHandles.skelHandle2, [-2 2 -1.5 1.5 0.85 4], 'equal'); % set axes limits
        set(displayHandles.skelHandle2, 'Color', 'k', 'XTick', [], 'YTick', [], 'ZTick', []); % set background colour
        view(displayHandles.skelHandle2, [az el]); % set viewpoint
        hold(displayHandles.skelHandle2, 'on'); % hold (last)
        
    case 'depthSkel'
        figure('KeyPressFcn',@KeyPressFcn);
        menuSetup
        % Resize the figure. Figure 'Position' is [left bottom width
        % height] and the display ratio is 4:3 and there are 3 images:
        my_pos = get(gcf, 'Position');
        my_pos(1) = 50;
        my_pos(4) = 300;
        my_pos(3) = my_pos(4) * (12/3);
        set(gcf, 'Position', my_pos);
        
        % for rotation to get behind Kinect:
        az = 180; el = -90;
        
        % For manual axes creation: [left bottom width height]
        
        % Notes: "axis vis3d freezes aspect ratio properties to enable
        % rotation of 3-D objects and overrides stretch-to-fill."
        
        % handle to where we plot the depth data:
        displayHandles.depthHandle = axes('position', [0.01 0.01 0.31 0.98]);
        axis(displayHandles.depthHandle, [0 512 0 424 0 70000], 'ij'); % set axes limits and image plotting (ij)
        set(displayHandles.depthHandle, 'Color', 'k', 'XTick', [], 'YTick', [], 'ZTick', []); % set background colour and turn axes labels off
        view(displayHandles.depthHandle, [az el]); % set viewpoint
        hold(displayHandles.depthHandle, 'on'); % hold (last)
        
        % handle to where we plot the 3D skeleton:
        displayHandles.skelHandle = axes('position', [0.33 0.01 0.31 0.98]);
        axis(displayHandles.skelHandle, [-2 2 -1.5 1.5 0.85 4], 'equal'); % set axes limits
        set(displayHandles.skelHandle, 'Color', 'k', 'XTick', [], 'YTick', [], 'ZTick', []); % set background colour
        view(displayHandles.skelHandle, [az el]); % set viewpoint
        hold(displayHandles.skelHandle, 'on'); % hold (last)
        
end
set(gcf, 'Render', 'opengl');

end

