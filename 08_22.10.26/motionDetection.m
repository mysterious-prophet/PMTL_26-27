function motionDetection()
    % two synthetic 100x100 grayscale frames from a security camera
    frame1 = 50 * ones(100, 100);
    frame2 = frame1;
    
    % insert an intruder (a dark square)
    frame2(40:60, 20:40) = 10;
    
    % add random static noise to both frames
    frame1 = frame1 + 5 * randn(100, 100);
    frame2 = frame2 + 5 * randn(100, 100);
    
    figure;
    subplot(1, 3, 1);
    imagesc(frame1);
    colormap('gray');
    axis square;
    title('Frame 1');

    subplot(1, 3, 2);
    imagesc(frame2);
    colormap('gray');
    axis square;
    title('Frame 2');
    
    % motion diff. and mask
    diff_frame = frame2 - frame1;
    abs_diff = abs(diff_frame);
    motion_mask = abs_diff > 25;

    % plot motion approx.
    subplot(1, 3, 3);
    imagesc(motion_mask);
    colormap('gray'); axis square;
    title('Detected Motion');
end