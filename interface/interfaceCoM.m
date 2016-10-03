function interfaceCoM(src,event )
%%This script generates the CoM for the selected action sequence

%Load the file sequence
global fileLoc;
file = fileLoc;

%Load the data
data = load([file '/SkelData.mat']);

%Compute CoM - note the varible to determine the time element.
[C, V] = getCoM(data.skel,1);

%State the figure name
figure('name','Centre-of-Mass - Default 1');
%set(gcf, 'MenuBar', 'None')
plot3(C(:,1),C(:,2), C(:,3));
cP = mean(C);
hold on;
scatter3(cP(1),cP(2), cP(3), 'MarkerEdgeColor','r',...
    'MarkerFaceColor','r',...
    'LineWidth',3);
scatter3(C(1,1),C(1,2), C(1,3), 'MarkerEdgeColor','g',...
    'MarkerFaceColor','g',...
    'LineWidth',3);
scatter3(C(end,1),C(end,2), C(end,3), 'MarkerEdgeColor','y',...
    'MarkerFaceColor','y',...
    'LineWidth',3);
hold off;
legend('Trace','Mean','Start', 'End');

%Options - button click setup
uicontrol('Style', 'popup',...
    'String', 'COM|COMChange',...
    'Position', [10 340 200 50],'Callback',@Button_Callback);

    function Button_Callback(hObject,event)
        val = get(hObject,'Value');
        if val ==1
            cla
            plot3(C(:,1),C(:,2), C(:,3));
            cP = mean(C);
            hold on;
            scatter3(cP(1),cP(2), cP(3), 'MarkerEdgeColor','r',...
                'MarkerFaceColor','r',...
                'LineWidth',3);
            scatter3(C(1,1),C(1,2), C(1,3), 'MarkerEdgeColor','g',...
                'MarkerFaceColor','g',...
                'LineWidth',3);
            scatter3(C(end,1),C(end,2), C(end,3), 'MarkerEdgeColor','y',...
                'MarkerFaceColor','y',...
                'LineWidth',3);
            hold off;
            legend('Trace','Mean','Start', 'End');
            
        elseif val == 2
            cla
            plot(V);
            axis([0 size(V,1) min(V) max(V)]);
            
            
        end
    end
end

