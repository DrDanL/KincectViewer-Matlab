function interfaceMChange(src,event)
%Interface - Display the Mean Change of each joint x compred to its
%corresponding joint

%Load the file sequence
global fileLoc;
file = fileLoc;

%Load the data
data = load([file '/SkelData.mat']);

%Compute the distance change over time
[C] = getMChange(data.skel, 1);

figure('name','Mean Change - Over Time - Default 1');
set(gcf, 'MenuBar', 'None')

%X Axis
plot(C(:,1)) %Set Default Data (Spine)
title('SpineBase');
axis([0 size(C,1) min(min(C)) max(max(C))]);

%Options
uicontrol('Style', 'popup',...
    'String', 'SpineBase|SpineMid|Neck|Head|ShouldLeft|ElbowLeft|WristLeft|HandLeft|ShoulderRight|ElbowRight|WristRight|HandRight|HipLeft|KneeLeft|AnkleLeft|FootLeft|HipRight|KneeRight|AnkleRight|FootRight|SpineShoulder|HandTipLeft|ThumbLeft|HandTipRight|ThumbRight',...
    'Position', [20 340 200 80],'Callback',@Button_Callback);

    function Button_Callback(hObject,event)
        val = get(hObject,'Value');
        if val ==1
            plot(C(:,1))
            title('SpineBase');
            axis([0 size(C,1) min(min(C)) max(max(C))]);
            
        elseif val == 2
            plot(C(:,2))
            title('SpineMid');
            axis([0 size(C,1) min(min(C)) max(max(C))]);
            
        elseif val == 3
            plot(C(:,3))
            title('Neck');
            axis([0 size(C,1) min(min(C)) max(max(C))]);
            
        elseif val == 4
            plot(C(:,4))
            title('Head');
            axis([0 size(C,1) min(min(C)) max(max(C))]);
            
        elseif val == 5
            plot(C(:,5))
            title('ShouldLeft');
            axis([0 size(C,1) min(min(C)) max(max(C))]);
            
        elseif val == 6
            plot(C(:,6))
            title('ElbowLeft');
            axis([0 size(C,1) min(min(C)) max(max(C))]);
            
        elseif val == 7
            plot(C(:,7))
            title('WristLeft');
            axis([0 size(C,1) min(min(C)) max(max(C))]);
            
        elseif val == 8
            plot(C(:,8))
            title('HandLeft');
            axis([0 size(C,1) min(min(C)) max(max(C))]);
            
        elseif val == 9
            plot(C(:,9))
            title('ShoulderRight');
            axis([0 size(C,1) min(min(C)) max(max(C))]);
            
        elseif val == 10
            plot(C(:,10))
            title('ElbowRight');
            axis([0 size(C,1) min(min(C)) max(max(C))]);
            
        elseif val == 11
            plot(C(:,11))
            title('WristRight');
            axis([0 size(C,1) min(min(C)) max(max(C))]);
            
        elseif val == 12
            plot(C(:,12))
            title('HandRight');
            axis([0 size(C,1) min(min(C)) max(max(C))]);
            
        elseif val == 13
            plot(C(:,13))
            title('HipLeft');
            axis([0 size(C,1) min(min(C)) max(max(C))]);
            
        elseif val == 14
            plot(C(:,14))
            title('KneeLeft');
            axis([0 size(C,1) min(min(C)) max(max(C))]);
            
        elseif val == 15
            plot(C(:,15))
            title('AnkleLeft');
            axis([0 size(C,1) min(min(C)) max(max(C))]);
            
        elseif val == 16
            plot(C(:,16))
            title('FootLeft');
            axis([0 size(C,1) min(min(C)) max(max(C))]);
            
        elseif val == 17
            plot(C(:,17))
            title('HipRight');
            axis([0 size(C,1) min(min(C)) max(max(C))]);
            
        elseif val == 18
            plot(C(:,18))
            title('KneeRight');
            axis([0 size(C,1) min(min(C)) max(max(C))]);
            
        elseif val == 19
            plot(C(:,19))
            title('AnkleRight');
            axis([0 size(C,1) min(min(C)) max(max(C))]);
            
        elseif val == 20
            plot(C(:,20))
            title('FootRight');
            axis([0 size(C,1) min(min(C)) max(max(C))]);
            
        elseif val == 21
            plot(C(:,21))
            title('SpineShoulder');
            axis([0 size(C,1) min(min(C)) max(max(C))]);
            
        elseif val == 22
            plot(C(:,22))
            title('HandTipLeft');
            axis([0 size(C,1) min(min(C)) max(max(C))]);
            
        elseif val == 23
            plot(C(:,23))
            title('ThumbLeft');
            axis([0 size(C,1) min(min(C)) max(max(C))]);
            
        elseif val == 24
            plot(C(:,24))
            title('HandTipRight');
            axis([0 size(C,1) min(min(C)) max(max(C))]);
            
        elseif val == 25
            plot(C(:,25))
            title('ThumbRight');
            axis([0 size(C,1) min(min(C)) max(max(C))]);
            
        end
    end
end
