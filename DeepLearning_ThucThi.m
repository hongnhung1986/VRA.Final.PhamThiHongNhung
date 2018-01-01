function nImgTrue = DeepLearning_ThucThi( )   
	load('DataTrainAlexnet.mat');
    load('ClassifierAlexnet.mat');
    load('DataTestAlexnet.mat');
    nResult = (lblActualDataTest == lblResult);
    nImgTrue = sum(nResult);
end

