function KeyPressFcn( src,event )
%%This function handles key press events for the main display. 

global sPause;
global i;
global iIt;

if event.Character == 'p'
    sPause = true;
    disp('paused')
end

if event.Character == 's'
    sPause = false;
    iIt = true;
    
    disp('play')
end

if event.Character == 'f'
    sPause = true;
    iIt = false;
    i = i+1;
    disp(['forward'  num2str(i)])
end

if event.Character == 'b'
    sPause = true;
    iIt = false;
    i = i-1;
    disp(['backward' num2str(i)])
end

if event.Character == 'c'
    close all
    disp('close all');
end

end

