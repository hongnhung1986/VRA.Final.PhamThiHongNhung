 
function CreateDataTrain()
    %%Load Image Dât Train
    imgTrainAll=loadMNISTImages('train-images.idx3-ubyte');
    lblTrainAll=loadMNISTImages('train-labels.idx1-ubyte');
    nTrainImages=size(imgTrainAll,2);
    %%Create Folders
    for i=0:9
        mkdir('DataTrain\' num2str(i)]);
    end
    %%Extract Images to Folders
    index=zeros(1,10);
    for i=1:nTrainAll(:,i);
        imgI=imgTrainAll(:,i);
        
    end
end