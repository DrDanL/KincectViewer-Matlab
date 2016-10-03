function interfaceStatic(src,event)
%This function displays each of the static features we have computed

%Load the file sequence
global fileLoc;
file = fileLoc;

%Load the data
data = load([file '/SkelData.mat']);

%Compute the distance change over time
[S] = getStaticFeatures(data.skel);

figure('name','Static Features - Over Time');
set(gcf, 'MenuBar', 'None')

%X Axis
plot(S(:,1)) %Set Default Data (Height)
title('Height');
axis([0 size(S,1) min(min(S)) max(max(S))]);

%Options
uicontrol('Style', 'popup',...
    'String', 'Height|Torso|LeftLeg|RightLeg|LowerLeft|LowerRight|LeftThigh|RightThigh|LeftArmUpper|RightArmUpper|LeftArmLower|RightArmLower|ShoulderSpane',...
    'Position', [20 340 200 80],'Callback',@Button_Callback);

    function Button_Callback(hObject,event)
        val = get(hObject,'Value');
        if val ==1
            plot(S(:,1))
            title('Height');
            axis([0 size(S,1) min(min(S)) max(max(S))]);
            
        elseif val == 2
            plot(S(:,2))
            title('Torso');
            axis([0 size(S,1) min(min(S)) max(max(S))]);
            
        elseif val == 3
            plot(S(:,3))
            title('LeftLeg');
            axis([0 size(S,1) min(min(S)) max(max(S))]);
            
        elseif val == 4
            plot(S(:,4))
            title('RightLeg');
            axis([0 size(S,1) min(min(S)) max(max(S))]);
            
        elseif val == 5
            plot(S(:,5))
            title('LowerLeft');
            axis([0 size(S,1) min(min(S)) max(max(S))]);
            
        elseif val == 6
            plot(S(:,6))
            title('LowerRight');
            axis([0 size(S,1) min(min(S)) max(max(S))]);
            
        elseif val == 7
            plot(S(:,7))
            title('LeftThigh');
            axis([0 size(S,1) min(min(S)) max(max(S))]);
            
        elseif val == 8
            plot(S(:,8))
            title('RightThigh');
            axis([0 size(S,1) min(min(S)) max(max(S))]);
            
        elseif val == 9
            plot(S(:,9))
            title('LeftArmUpper');
            axis([0 size(S,1) min(min(S)) max(max(S))]);
            
        elseif val == 10
            plot(S(:,10))
            title('RightArmUpper');
            axis([0 size(S,1) min(min(S)) max(max(S))]);
            
        elseif val == 11
            plot(S(:,11))
            title('LeftArmLower');
            axis([0 size(S,1) min(min(S)) max(max(S))]);
            
        elseif val == 12
            plot(S(:,12))
            title('RightArmLower');
            axis([0 size(S,1) min(min(S)) max(max(S))]);
            
        elseif val == 13
            plot(S(:,13))
            title('ShoulderSpane');
            axis([0 size(S,1) min(min(S)) max(max(S))]);
        end
        
        
    end

end