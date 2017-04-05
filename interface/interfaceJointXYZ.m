function interfaceJointXYZ(src,event)
%Interface - Joint XYZ Plot

%Load the file sequence
global fileLoc;
file = fileLoc;
%Load the data
data = load([file '/SkelData.mat']);

figure('name','XYZ Joint Plot');
set(gcf, 'MenuBar', 'None')

%Plot for button controls
subplot(4,1,1);
axis('off');
set(gca,'ytick',[]);
set(gca,'xtick',[]);

%X Axis
h2 = subplot(4,1,2);
plot(data.skel(:,1)) %Set Default Data (Spine)
title('X Axis Joint - SpineBase');

%Y Axis
h3= subplot(4,1,3);
plot(data.skel(:,2)) %Set Default Data (Spine)
title('Y Axis Joint - SpineBase');

%Z Axis
h4 = subplot(4,1,4);
plot(data.skel(:,3)) %Set Default Data (Spine)
title('Z Axis Joint - SpineBase');

%Options
uicontrol('Style', 'popup',...
    'String', 'SpineBase|SpineMid|Neck|Head|ShouldLeft|ElbowLeft|WristLeft|HandLeft|ShoulderRight|ElbowRight|WristRight|HandRight|HipLeft|KneeLeft|AnkleLeft|FootLeft|HipRight|KneeRight|AnkleRight|FootRight|SpineShoulder|HandTipLeft|ThumbLeft|HandTipRight|ThumbRight',...
    'Position', [20 340 200 50],'Callback',@Button_Callback);

    function Button_Callback(hObject,event)
        val = get(hObject,'Value');
        if val ==1
            h2 = subplot(4,1,2);
            plot(data.skel(:,1))
            title('X Axis Joint - SpineBase');
            
            %Y Axis
            h3= subplot(4,1,3);
            plot(data.skel(:,2))
            title('Y Axis Joint - SpineBase');
            
            %Z Axis
            h4 = subplot(4,1,4);
            plot(data.skel(:,3))
            title('Z Axis Joint - SpineBase');
            
        elseif val == 2
            h2 = subplot(4,1,2);
            plot(data.skel(:,4))
            title('X Axis Joint - SpineMid');
            
            %Y Axis
            h3= subplot(4,1,3);
            plot(data.skel(:,5))
            title('Y Axis Joint - SpineMid');
            
            %Z Axis
            h4 = subplot(4,1,4);
            plot(data.skel(:,6))
            title('Z Axis Joint - SpineMid');
            
        elseif val == 3
            h2 = subplot(4,1,2);
            plot(data.skel(:,7))
            title('X Axis Joint - Neck');
            
            %Y Axis
            h3= subplot(4,1,3);
            plot(data.skel(:,8))
            title('Y Axis Joint - Neck');
            
            %Z Axis
            h4 = subplot(4,1,4);
            plot(data.skel(:,9))
            title('Z Axis Joint - Neck');
            
        elseif val == 4
            h2 = subplot(4,1,2);
            plot(data.skel(:,10))
            title('X Axis Joint - Head');
            
            %Y Axis
            h3= subplot(4,1,3);
            plot(data.skel(:,11))
            title('Y Axis Joint - Head');
            
            %Z Axis
            h4 = subplot(4,1,4);
            plot(data.skel(:,12))
            title('Z Axis Joint - Head');
            
        elseif val == 5
            h2 = subplot(4,1,2);
            plot(data.skel(:,13))
            title('X Axis Joint - ShouldLeft');
            
            %Y Axis
            h3= subplot(4,1,3);
            plot(data.skel(:,14))
            title('Y Axis Joint - ShouldLeft');
            
            %Z Axis
            h4 = subplot(4,1,4);
            plot(data.skel(:,15))
            title('Z Axis Joint - ShouldLeft');
            
        elseif val == 6
            h2 = subplot(4,1,2);
            plot(data.skel(:,16))
            title('X Axis Joint - ElbowLeft');
            
            %Y Axis
            h3= subplot(4,1,3);
            plot(data.skel(:,17))
            title('Y Axis Joint - ElbowLeft');
            
            %Z Axis
            h4 = subplot(4,1,4);
            plot(data.skel(:,18))
            title('Z Axis Joint - ElbowLeft');
            
        elseif val == 7
            h2 = subplot(4,1,2);
            plot(data.skel(:,19))
            title('X Axis Joint - WristLeft');
            
            %Y Axis
            h3= subplot(4,1,3);
            plot(data.skel(:,20))
            title('Y Axis Joint - WristLeft');
            
            %Z Axis
            h4 = subplot(4,1,4);
            plot(data.skel(:,21))
            title('Z Axis Joint - WristLeft');
            
        elseif val == 8
            h2 = subplot(4,1,2);
            plot(data.skel(:,22))
            title('X Axis Joint - HandLeft');
            
            %Y Axis
            h3= subplot(4,1,3);
            plot(data.skel(:,23))
            title('Y Axis Joint - HandLeft');
            
            %Z Axis
            h4 = subplot(4,1,4);
            plot(data.skel(:,24))
            title('Z Axis Joint - HandLeft');
            
        elseif val == 9
            h2 = subplot(4,1,2);
            plot(data.skel(:,25))
            title('X Axis Joint - ShoulderRight');
            
            %Y Axis
            h3= subplot(4,1,3);
            plot(data.skel(:,26))
            title('Y Axis Joint - ShoulderRight');
            
            %Z Axis
            h4 = subplot(4,1,4);
            plot(data.skel(:,27))
            title('Z Axis Joint - ShoulderRight');
            
        elseif val == 10
            h2 = subplot(4,1,2);
            plot(data.skel(:,28))
            title('X Axis Joint - ElbowRight');
            
            %Y Axis
            h3= subplot(4,1,3);
            plot(data.skel(:,29))
            title('Y Axis Joint - ElbowRight');
            
            %Z Axis
            h4 = subplot(4,1,4);
            plot(data.skel(:,30))
            title('Z Axis Joint - ElbowRight');
            
        elseif val == 11
            h2 = subplot(4,1,2);
            plot(data.skel(:,31))
            title('X Axis Joint - WristRight');
            
            %Y Axis
            h3= subplot(4,1,3);
            plot(data.skel(:,32))
            title('Y Axis Joint - WristRight');
            
            %Z Axis
            h4 = subplot(4,1,4);
            plot(data.skel(:,33))
            title('Z Axis Joint - WristRight');
            
        elseif val == 12
            h2 = subplot(4,1,2);
            plot(data.skel(:,34))
            title('X Axis Joint - HandRight');
            
            %Y Axis
            h3= subplot(4,1,3);
            plot(data.skel(:,35))
            title('Y Axis Joint - HandRight');
            
            %Z Axis
            h4 = subplot(4,1,4);
            plot(data.skel(:,36))
            title('Z Axis Joint - HandRight');
            
        elseif val == 13
            h2 = subplot(4,1,2);
            plot(data.skel(:,37))
            title('X Axis Joint - HipLeft');
            
            %Y Axis
            h3= subplot(4,1,3);
            plot(data.skel(:,38))
            title('Y Axis Joint - HipLeft');
            
            %Z Axis
            h4 = subplot(4,1,4);
            plot(data.skel(:,39))
            title('Z Axis Joint - HipLeft');
            
        elseif val == 14
            h2 = subplot(4,1,2);
            plot(data.skel(:,40))
            title('X Axis Joint - KneeLeft');
            
            %Y Axis
            h3= subplot(4,1,3);
            plot(data.skel(:,41))
            title('Y Axis Joint - KneeLeft');
            
            %Z Axis
            h4 = subplot(4,1,4);
            plot(data.skel(:,42))
            title('Z Axis Joint - KneeLeft');
            
        elseif val == 15
            h2 = subplot(4,1,2);
            plot(data.skel(:,43))
            title('X Axis Joint - AnkleLeft');
            
            %Y Axis
            h3= subplot(4,1,3);
            plot(data.skel(:,44))
            title('Y Axis Joint - AnkleLeft');
            
            %Z Axis
            h4 = subplot(4,1,4);
            plot(data.skel(:,45))
            title('Z Axis Joint - AnkleLeft');
            
        elseif val == 16
            h2 = subplot(4,1,2);
            plot(data.skel(:,46))
            title('X Axis Joint - FootLeft');
            
            %Y Axis
            h3= subplot(4,1,3);
            plot(data.skel(:,47))
            title('Y Axis Joint - FootLeft');
            
            %Z Axis
            h4 = subplot(4,1,4);
            plot(data.skel(:,48))
            title('Z Axis Joint - FootLeft');
            
        elseif val == 17
            h2 = subplot(4,1,2);
            plot(data.skel(:,49))
            title('X Axis Joint - HipRight');
            
            %Y Axis
            h3= subplot(4,1,3);
            plot(data.skel(:,50))
            title('Y Axis Joint - HipRight');
            
            %Z Axis
            h4 = subplot(4,1,4);
            plot(data.skel(:,51))
            title('Z Axis Joint - HipRight');
            
        elseif val == 18
            h2 = subplot(4,1,2);
            plot(data.skel(:,52))
            title('X Axis Joint - KneeRight');
            
            %Y Axis
            h3= subplot(4,1,3);
            plot(data.skel(:,53))
            title('Y Axis Joint - KneeRight');
            
            %Z Axis
            h4 = subplot(4,1,4);
            plot(data.skel(:,54))
            title('Z Axis Joint - KneeRight');
            
        elseif val == 19
            h2 = subplot(4,1,2);
            plot(data.skel(:,55))
            title('X Axis Joint - AnkleRight');
            
            %Y Axis
            h3= subplot(4,1,3);
            plot(data.skel(:,56))
            title('Y Axis Joint - AnkleRight');
            
            %Z Axis
            h4 = subplot(4,1,4);
            plot(data.skel(:,57))
            title('Z Axis Joint - AnkleRight');
            
        elseif val == 20
            h2 = subplot(4,1,2);
            plot(data.skel(:,58))
            title('X Axis Joint - FootRight');
            
            %Y Axis
            h3= subplot(4,1,3);
            plot(data.skel(:,59))
            title('Y Axis Joint - FootRight');
            
            %Z Axis
            h4 = subplot(4,1,4);
            plot(data.skel(:,60))
            title('Z Axis Joint - FootRight');
            
        elseif val == 21
            h2 = subplot(4,1,2);
            plot(data.skel(:,61))
            title('X Axis Joint - SpineShoulder');
            
            %Y Axis
            h3= subplot(4,1,3);
            plot(data.skel(:,62))
            title('Y Axis Joint - SpineShoulder');
            
            %Z Axis
            h4 = subplot(4,1,4);
            plot(data.skel(:,63))
            title('Z Axis Joint - SpineShoulder');
            
        elseif val == 22
            h2 = subplot(4,1,2);
            plot(data.skel(:,64))
            title('X Axis Joint - HandTipLeft');
            
            %Y Axis
            h3= subplot(4,1,3);
            plot(data.skel(:,65))
            title('Y Axis Joint - HandTipLeft');
            
            %Z Axis
            h4 = subplot(4,1,4);
            plot(data.skel(:,66))
            title('Z Axis Joint - HandTipLeft');
            
        elseif val == 23
            h2 = subplot(4,1,2);
            plot(data.skel(:,67))
            title('X Axis Joint - ThumbLeft');
            
            %Y Axis
            h3= subplot(4,1,3);
            plot(data.skel(:,68))
            title('Y Axis Joint - ThumbLeft');
            
            %Z Axis
            h4 = subplot(4,1,4);
            plot(data.skel(:,69))
            title('Z Axis Joint - ThumbLeft');
            
        elseif val == 24
            h2 = subplot(4,1,2);
            plot(data.skel(:,70))
            title('X Axis Joint - HandTipRight');
            
            %Y Axis
            h3= subplot(4,1,3);
            plot(data.skel(:,71))
            title('Y Axis Joint - HandTipRight');
            
            %Z Axis
            h4 = subplot(4,1,4);
            plot(data.skel(:,72))
            title('Z Axis Joint - HandTipRight');
            
        elseif val == 25
            h2 = subplot(4,1,2);
            plot(data.skel(:,73))
            title('X Axis Joint - ThumbRight');
            
            %Y Axis
            h3= subplot(4,1,3);
            plot(data.skel(:,74))
            title('Y Axis Joint - ThumbRight');
            
            %Z Axis
            h4 = subplot(4,1,4);
            plot(data.skel(:,75))
            title('Z Axis Joint - ThumbRight');
            
        end
    end
end
