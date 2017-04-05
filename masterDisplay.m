function masterDisplay(fileInpt)

global fileLoc;
fileLoc = fileInpt;

%Generate new skeleton file (if it does not exist already)
genSkelFile(fileLoc);

%Display Sequence
sequenceData = ReadSequence(fileLoc);

%Display the sequenceData based on a time ordering
displayKinectSequence(sequenceData, 'all');

end

