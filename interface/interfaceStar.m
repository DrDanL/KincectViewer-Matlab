function interfaceStar(src,event)
%This script displays the star skeleton distance results in a plot. The 
%distance from the CoM t each joint.  

%Load the file sequence
global fileLoc;
file = fileLoc;

%Load the data
data = load([file '/SkelData.mat']);

%Compute CoM - note the varible to determine the time element. 
[C, ~] = getCoM(data.skel,1);

%Get Star Skeleton Distance
[S] = getStarSkeleton(data.skel,C);

figure('name','Star Skeleton Features');
set(gcf, 'MenuBar', 'None')

%X Axis
plot(S(:,1)) %Set Default Data (Spine)
axis([0 size(S,1) min(min(S)) max(max(S))]);
title('SpineBase');

%Options
uicontrol('Style', 'popup',...
    'String', 'SpineBase|SpineMid|Neck|Head|ShouldLeft|ElbowLeft|WristLeft|HandLeft|ShoulderRight|ElbowRight|WristRight|HandRight|HipLeft|KneeLeft|AnkleLeft|FootLeft|HipRight|KneeRight|AnkleRight|FootRight|SpineShoulder|HandTipLeft|ThumbLeft|HandTipRight|ThumbRight',...
    'Position', [1 340 200 80],'Callback',@Button_Callback);

    function Button_Callback(hObject,event)
        val = get(hObject,'Value');
        if val ==1
            plot(S(:,1))
            title('SpineBase');
            axis([0 size(S,1) min(min(S)) max(max(S))]);

        elseif val == 2
            plot(S(:,2))
            title('SpineMid');
            axis([0 size(S,1) min(min(S)) max(max(S))]);

        elseif val == 3
            plot(S(:,3))
            title('Neck');
            axis([0 size(S,1) min(min(S)) max(max(S))]);

        elseif val == 4
            plot(S(:,4))
            title('Head');
            axis([0 size(S,1) min(min(S)) max(max(S))]);

        elseif val == 5
            plot(S(:,5))
            title('ShouldLeft');
            axis([0 size(S,1) min(min(S)) max(max(S))]);

        elseif val == 6
            plot(S(:,6))
            title('ElbowLeft');
            axis([0 size(S,1) min(min(S)) max(max(S))]);

        elseif val == 7
            plot(S(:,7))
            title('WristLeft');
            axis([0 size(S,1) min(min(S)) max(max(S))]);

        elseif val == 8
            plot(S(:,8))
            title('HandLeft');
            axis([0 size(S,1) min(min(S)) max(max(S))]);

        elseif val == 9
            plot(S(:,9))
            title('ShoulderRight');
            axis([0 size(S,1) min(min(S)) max(max(S))]);

        elseif val == 10
            plot(S(:,10))
            title('ElbowRight');
            axis([0 size(S,1) min(min(S)) max(max(S))]);

        elseif val == 11
            plot(S(:,11))
            title('WristRight');
            axis([0 size(S,1) min(min(S)) max(max(S))]);

        elseif val == 12
            plot(S(:,12))
            title('HandRight');
            axis([0 size(S,1) min(min(S)) max(max(S))]);

        elseif val == 13
            plot(S(:,13))
            title('HipLeft');
            axis([0 size(S,1) min(min(S)) max(max(S))]);

        elseif val == 14
            plot(S(:,14))
            title('KneeLeft');
            axis([0 size(S,1) min(min(S)) max(max(S))]);

        elseif val == 15
            plot(S(:,15))
            title('AnkleLeft');
            axis([0 size(S,1) min(min(S)) max(max(S))]);

        elseif val == 16
            plot(S(:,16))
            title('FootLeft');
            axis([0 size(S,1) min(min(S)) max(max(S))]);

        elseif val == 17
            plot(S(:,17))
            title('HipRight');
            axis([0 size(S,1) min(min(S)) max(max(S))]);

        elseif val == 18
            plot(S(:,18))
            title('KneeRight');
            axis([0 size(S,1) min(min(S)) max(max(S))]);

        elseif val == 19
            plot(S(:,19))
            title('AnkleRight');
            axis([0 size(S,1) min(min(S)) max(max(S))]);

        elseif val == 20
            plot(S(:,20))
            title('FootRight');
            axis([0 size(S,1) min(min(S)) max(max(S))]);

        elseif val == 21
            plot(S(:,21))
            title('SpineShoulder');
            axis([0 size(S,1) min(min(S)) max(max(S))]);

        elseif val == 22
            plot(S(:,22))
            title('HandTipLeft');
            axis([0 size(S,1) min(min(S)) max(max(S))]);

        elseif val == 23
            plot(S(:,23))
            title('ThumbLeft');
            axis([0 size(S,1) min(min(S)) max(max(S))]);

        elseif val == 24
            plot(S(:,24))
            title('HandTipRight');
            axis([0 size(S,1) min(min(S)) max(max(S))]);

        elseif val == 25
            plot(S(:,25))
            title('ThumbRight');
            axis([0 size(S,1) min(min(S)) max(max(S))]);

        end
    end


end

