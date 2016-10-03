function interfaceStarVelocity(src,event)
%This script displays the Star Skeleton Velocity for each time period. We
%display for each joint the change over time t between two star skeleton
%distances. 

%Load the file sequence
global fileLoc;
file = fileLoc;

%Load the data
data = load([file '/SkelData.mat']);

%Get Star Skeleton Distance
[V] = getStarVelocity(data.skel,1 );

figure('name','Star Skeleton Velocity - Default 1');
set(gcf, 'MenuBar', 'None')

%X Axis
plot(V(:,1)) %Set Default Data (Spine)
axis([0 size(V,1) min(min(V)) max(max(V))]);
title('SpineBase');

%Options
uicontrol('Style', 'popup',...
    'String', 'SpineBase|SpineMid|Neck|Head|ShouldLeft|ElbowLeft|WristLeft|HandLeft|ShoulderRight|ElbowRight|WristRight|HandRight|HipLeft|KneeLeft|AnkleLeft|FootLeft|HipRight|KneeRight|AnkleRight|FootRight|SpineShoulder|HandTipLeft|ThumbLeft|HandTipRight|ThumbRight',...
    'Position', [1 340 200 80],'Callback',@Button_Callback);

    function Button_Callback(hObject,event)
        val = get(hObject,'Value');
        if val ==1
            plot(V(:,1))
            title('SpineBase');
            axis([0 size(V,1) min(min(V)) max(max(V))]);

        elseif val == 2
            plot(V(:,2))
            title('SpineMid');
            axis([0 size(V,1) min(min(V)) max(max(V))]);

        elseif val == 3
            plot(V(:,3))
            title('Neck');
            axis([0 size(V,1) min(min(V)) max(max(V))]);

        elseif val == 4
            plot(V(:,4))
            title('Head');
            axis([0 size(V,1) min(min(V)) max(max(V))]);

        elseif val == 5
            plot(V(:,5))
            title('ShouldLeft');
            axis([0 size(V,1) min(min(V)) max(max(V))]);

        elseif val == 6
            plot(V(:,6))
            title('ElbowLeft');
            axis([0 size(V,1) min(min(V)) max(max(V))]);

        elseif val == 7
            plot(V(:,7))
            title('WristLeft');
            axis([0 size(V,1) min(min(V)) max(max(V))]);

        elseif val == 8
            plot(V(:,8))
            title('HandLeft');
            axis([0 size(V,1) min(min(V)) max(max(V))]);

        elseif val == 9
            plot(V(:,9))
            title('ShoulderRight');
            axis([0 size(V,1) min(min(V)) max(max(V))]);

        elseif val == 10
            plot(V(:,10))
            title('ElbowRight');
            axis([0 size(V,1) min(min(V)) max(max(V))]);

        elseif val == 11
            plot(V(:,11))
            title('WristRight');
            axis([0 size(V,1) min(min(V)) max(max(V))]);

        elseif val == 12
            plot(V(:,12))
            title('HandRight');
            axis([0 size(V,1) min(min(V)) max(max(V))]);

        elseif val == 13
            plot(V(:,13))
            title('HipLeft');
            axis([0 size(V,1) min(min(V)) max(max(V))]);

        elseif val == 14
            plot(V(:,14))
            title('KneeLeft');
            axis([0 size(V,1) min(min(V)) max(max(V))]);

        elseif val == 15
            plot(V(:,15))
            title('AnkleLeft');
            axis([0 size(V,1) min(min(V)) max(max(V))]);

        elseif val == 16
            plot(V(:,16))
            title('FootLeft');
            axis([0 size(V,1) min(min(V)) max(max(V))]);

        elseif val == 17
            plot(V(:,17))
            title('HipRight');
            axis([0 size(V,1) min(min(V)) max(max(V))]);

        elseif val == 18
            plot(V(:,18))
            title('KneeRight');
            axis([0 size(V,1) min(min(V)) max(max(V))]);

        elseif val == 19
            plot(V(:,19))
            title('AnkleRight');
            axis([0 size(V,1) min(min(V)) max(max(V))]);

        elseif val == 20
            plot(V(:,20))
            title('FootRight');
            axis([0 size(V,1) min(min(V)) max(max(V))]);

        elseif val == 21
            plot(V(:,21))
            title('SpineShoulder');
            axis([0 size(V,1) min(min(V)) max(max(V))]);

        elseif val == 22
            plot(V(:,22))
            title('HandTipLeft');
            axis([0 size(V,1) min(min(V)) max(max(V))]);

        elseif val == 23
            plot(V(:,23))
            title('ThumbLeft');
            axis([0 size(V,1) min(min(V)) max(max(V))]);

        elseif val == 24
            plot(V(:,24))
            title('HandTipRight');
            axis([0 size(V,1) min(min(V)) max(max(V))]);

        elseif val == 25
            plot(V(:,25))
            title('ThumbRight');
            axis([0 size(V,1) min(min(V)) max(max(V))]);

        end
    end

end

