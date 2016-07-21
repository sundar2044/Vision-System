%% detectAndTrackFaces
% Automatically detects and tracks multiple faces in a webcam-acquired
% video stream.
%
% Copyright 2013-2014 The MathWorks, Inc 

clear classes;

%% Instantiate video device, face detector, and KLT object tracker
vidObj = webcam;

faceDetector = vision.CascadeObjectDetector; % Finds faces by default
tracker = MultiObjectTrackerKLT;

%% Get a frame for frame-size information
frame = snapshot(vidObj);
frameSize = size(frame);


%% Create a video player instance
videoPlayer  = vision.VideoPlayer('Position',[200 100 fliplr(frameSize(1:2)+30)]);

%% Iterate until we have successfully detected a face
bboxes = [];
while isempty(bboxes)
    framergb = snapshot(vidObj);
    frame = rgb2gray(framergb);
    bboxes = faceDetector.step(frame);
end
tracker.addDetections(frame, bboxes);

%% And loop until the player is closed
frameNumber = 0;
keepRunning = true;
disp('Press Ctrl-C to exit...');
while keepRunning 
    
    framergb = snapshot(vidObj);
    frame = rgb2gray(framergb);
    
%     if mod(frameNumber,2) == 0
        % (Re)detect faces.
        %
        % NOTE: face detection is more expensive than imresize; we can
        % speed up the implementation by reacquiring faces using a
        % downsampled frame:
        % bboxes = faceDetector.step(frame);
    bboxes = 2 * faceDetector.step(imresize(frame, 0.5));
    if ~isempty(bboxes)

        bboxes = faceDetector.step(frame);
        tracker.addDetections(frame, bboxes);
    %end
    else
        tracker.track(frame);
%         % Track faces
%     
%         tracker.track(frame);
    end
    
    % Display bounding boxes and tracked points.
    displayFrame = insertObjectAnnotation(frame,'rectangle',tracker.Bboxes, tracker.BoxIds);
    displayFrame = insertMarker(displayFrame, tracker.Points);
    videoPlayer.step(displayFrame);
        % Display the annotated video frame using the video player object.
    step(videoPlayer, displayFrame);

    % Check whether the video player window has been closed.
    runLoop = isOpen(videoPlayer);
    frameNumber = frameNumber + 1;
end

%% Clean up
clear cam
release(pointTracker);
release(faceDetector);
release(videoPlayer);