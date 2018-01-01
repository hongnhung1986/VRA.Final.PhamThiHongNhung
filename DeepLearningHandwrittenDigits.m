function DeepLearningHandwrittenDigits
	strFolderDataTrain = fullfile('DataTrain');   
	categories = {'0', '1', '2','3','4','5','6','7','8','9'};
	imdsDataTrain = imageDatastore(fullfile(strFolderDataTrain, categories), 'LabelSource', 'foldernames');
    imdsDataTrain.ReadFcn = @(filename)readAndPreprocessImage(filename);
    
    net = alexnet()
    featureLayer = 'fc7';
    featuresDataTrain = activations(net, imdsDataTrain, featureLayer,'MiniBatchSize', 32, 'OutputAs', 'columns');
    lblDataTrain = imdsDataTrain.Labels;    
    save('datatrainalexnet.mat','featuresDataTrain','lblDataTrain');
	%load('datatrainalexnet.mat');
    
    classifier = fitcecoc(featuresDataTrain, lblDataTrain,'Learners', 'Linear', 'Coding', 'onevsall', 'ObservationsIn', 'columns');
    save('classifieralexnet.mat','classifier');
%     load('classifieralexnet.mat');
	strFolderDataTest = fullfile('DataTest');   
	categories = {'0', '1', '2','3','4','5','6','7','8','9'};
	imdsDataTest = imageDatastore(fullfile(strFolderDataTest, categories), 'LabelSource', 'foldernames');
    imdsDataTest.ReadFcn = @(filename)readAndPreprocessImage(filename);
    
    featuresDataTest = activations(net, imdsDataTest, featureLayer, 'MiniBatchSize',32);
    lblActualDataTest = imdsDataTest.Labels;
    lblResult = predict(classifier, featuresDataTest);
    save('datatestalexnet.mat','featuresDataTest','lblActualDataTest','lblResult');
    
    nResult = (lblActualDataTest == lblResult);
    nCount = sum(nResult);    
	fprintf('\nSo luong mau nhan dang dung: %d\n',nCount);
end