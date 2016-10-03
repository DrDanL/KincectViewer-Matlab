function paths_add
%Assign paths. Both for windows and mac
%Input:-
%   None
%Output:-
%   Pathways stored to Matlab
%History:-
%   Created by Dan 07/06/2013

global footpath;
footpath = cd;

%add path to batch folder
addpath(genpath([footpath '/batch']));

%add path to body folder
addpath(genpath([footpath '/body']));

%add path to display folder
addpath(genpath([footpath '/display']));

%add path to read folder
addpath(genpath([footpath '/jump_power']));

%add path to read folder
addpath(genpath([footpath '/read']));

%add path to classification folder
addpath(genpath([footpath '/classification']));

%add path to classification folder
addpath(genpath([footpath '/helper']));

%add path to preocessing folder
addpath(genpath([footpath '/preprocessing']));

%add path to classification folder
addpath(genpath([footpath '/save']));

%add path to classification folder
addpath(genpath([footpath '/interface']));

end


