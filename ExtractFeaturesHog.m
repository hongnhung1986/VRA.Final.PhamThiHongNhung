function [ featuresDataTrain ] = ExtractFeaturesHog( imgDataTrain )
    img1D = imgDataTrain(:, 1);
    img2D = reshape(img1D, 28, 28);
    [featureVector, hogVisualization] = extractHOGFeatures(img2D);
    nSize = length(featureVector);
    nTrainData = size(imgDataTrain, 2);
    featuresDataTrain = zeros(nSize, nTrainData);
    for i=1:nTrainData
        img1D = imgDataTrain(:, i);
        img2D = reshape(img1D, 28, 28);
        featuresDataTrain(:, i) = extractHOGFeatures(img2D);
    end

end

