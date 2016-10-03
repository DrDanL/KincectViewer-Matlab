function genSkelFile(fileLoc)
%This script converts a text file into a skeleton matrix. We then save it
%back to the same location

sequenceData = ReadSequence(fileLoc);

[depthTimesUnique, ~] = unique(sequenceData.depthTimes);
sequenceData.depthTimes = depthTimesUnique;

[skelUnique, ~] = unique(sequenceData.skelTimes);
sequenceData.skelTimes = skelUnique;

Skels.timestamp = {};
Skels.skel = [];

%Loop through and get each skeleton
for i=1:length(sequenceData.streamTimes)
    
    skelLoc = find(sequenceData.skelTimes == sequenceData.streamTimes(i));
    
    if ~isempty(skelLoc)
        temp = readKinectSkeletonIndid([sequenceData.name '/skel/' num2str(sequenceData.skelTimes(skelLoc)) '.txt'  ]);

        skelData = [temp.threeD{3}(:), temp.threeD{4}(:),temp.threeD{5}(:)];
        Skels.skel(i,:) = reshape(skelData',[1 size(skelData,1)*size(skelData,2)]);
        Skels.timestamp{i} = sequenceData.streamTimes(i);
        
    else
        temp = zeros(1,75);
        temp(temp ==0) = nan;
        Skels.skel(i,:) = temp;
        Skels.timestamp{i} = nan;
    end
    
end

newLoc = [sequenceData.name '/skelData.mat'];
save(newLoc,'-struct', 'Skels');
end
