function interfaceAngle(src,event )
%%This script allows th euser to view the reduced skeleton sequence

%Load the file sequence
global fileLoc;
file = fileLoc;

%Load the data
data = load([file '/SkelData.mat']);

%Generate Angle data
[A1, A2] = getJointAngleLoop(data.skel);

%generate figure
figure('name','Skeleton Angle');
plot(A2);

end

