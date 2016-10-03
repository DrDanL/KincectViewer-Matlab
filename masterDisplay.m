function masterDisplay(fileInpt)
%This function displays only the Kinect data. The user is promted to enter
%the desired loading location. 
clc

global fileLoc;
fileLoc = fileInpt;

%Generate new skeleton file (if it does not exist already)
genSkelFile(fileLoc);

%Display Sequence
sequenceData = ReadSequence(fileLoc);

%Display the sequenceData based on a time ordering
displayKinectSequence(sequenceData, 'all');


end

