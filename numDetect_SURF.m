function numDetect_SURF( )
    imgI = imread('cameraman.jpg'); %doc anh gray
    points = detectSURFFeatures(imgI);
    nNum = length(points);
    fprintf('\nSo luong diem detect duoc: %d\n',nNum)
end
% So luong diem detect duoc dung SURF la: 184
