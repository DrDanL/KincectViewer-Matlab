function paths_add
%Assign paths project pathways
%History:-
%   Created by Dan Leightley (dleightley@ieee.org) 04/04/2017

global footpath;
footpath = cd;

%add path to body folder
addpath(genpath([footpath '/body']));

%add path to display folder
addpath(genpath([footpath '/display']));

%add path to read folder
addpath(genpath([footpath '/read']));

%add path to classification folder
addpath(genpath([footpath '/classification']));

%add path to classification folder
addpath(genpath([footpath '/helper']));

%add path to preocessing folder
addpath(genpath([footpath '/preprocessing']));

%add path to classification folder
addpath(genpath([footpath '/interface']));

end


