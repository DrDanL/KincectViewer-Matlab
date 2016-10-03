f = uimenu('Label','Features');


dyn = uimenu(f, 'Label','Dynamic');
uimenu(dyn,'Label','Joints (XYZ)','Callback',@interfaceJointXYZ);
uimenu(dyn,'Label','CoM','Callback',@interfaceCoM);
uimenu(dyn,'Label','StarSkeleton','Callback',@interfaceStar);
uimenu(dyn,'Label','StarSkeletonChange','Callback',@interfaceStarVelocity);
uimenu(dyn,'Label','MeanSkeletonChange','Callback',@interfaceMChange);
uimenu(dyn,'Label','SkeleonAngle','Callback',@interfaceAngle);
uimenu(dyn,'Label','AbsoluteChange','Callback',@interAbsChange);

dyn = uimenu(f, 'Label','Static');
uimenu(dyn,'Label','StaticFeatures','Callback',@interfaceStatic);



