function demoHog()
    imgTrain = loadMNISTImages('train-images.idx3-ubyte');
    lblTrain = loadMNISTLabels('train-labels.idx1-ubyte');
    img1D = imgTrain(:, 1985);
    img2D = reshape(img1D, 28, 28);
    subplot(3,5,1);
    imshow(img2D);
    
    [featuresVector, visualHog] = extractHOGFeatures(img2D);
    subplot(3,5,2);
    plot(visualHog);
    subplot(3,5,3);
    hist(featuresVector);
    
    [featuresVector, visualHog] = extractHOGFeatures(img2D,'CellSize',[4 4]);
    subplot(3,5,6);
    plot(visualHog);
    subplot(3,5,7);
    hist(featuresVector);
end

