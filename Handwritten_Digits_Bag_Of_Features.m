function Handwritten_Digits_Bag_Of_Features()
    %% Load Image Data Train
    rootFolder = fullfile('DataTrain');
    categories = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9'};
    imds = imageDatastore(fullfile(rootFolder, categories), 'LabelSource', 'foldernames');
    tbl01 = countEachLabel(imds);
    minSetCount = min(tbl01{:, 2});
    imds = splitEachLabel(imds, minSetCount, 'randomize');
    tbl02 = countEachLabel(imds);
    
    %% Check whether BoF Model file exist. If yes, load it. Otherwise train the model and save it.
    if exist('BoF.mat', 'file') == 2
        load('BoF.mat');
    else
        bag = bagOfFeatures(imds);
        save('BoF.mat', 'bag');
    end
    
    img = readimage(imds, 1);
    featureVector = encode(bag, img);
%     figure;
%     bar(featureVector);
%     title('Visual word occurrences');
%     xlabel('Visual word index');
%     ylabel('Frequency of occurrences');
    
    %% Check whether BoF Classifier file exist. If yes, load it. Otherwise train the classifier and save it.
    if exist('BoFClassifier.mat', 'file') == 2
        load('BoFClassifier.mat');
    else
        categoryClassifier = trainImageCategoryClassifier(imds, bag);
        save('BoFClassifier.mat', 'categoryClassifier');
    end
    
    rootFolder = fullfile('DataTest');
    categories = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9'};
    imds = imageDatastore(fullfile(rootFolder, categories), 'LabelSource', 'foldernames');
    tbl01 = countEachLabel(imds);
    confMatrixTest = evaluate(categoryClassifier, imds);
    kq = mean(diag(confMatrixTest));
end