clc
clear
close all

%%
GroundTruth = load('groundtruth_mask_p2.mat');
GroundTruth  = GroundTruth.groundtruth_mask_p2;
PredictedMap = load('predicted_mask_p2.mat');
PredictedMap = PredictedMap.predicted_mask_p2;
CTimgs = load('test_ct_p2.mat');
CTimgs = CTimgs.test_ct_p2;
%%
target_slice = 15;
target_GT = GroundTruth(:,:,target_slice);
target_Predicted = PredictedMap(:,:,target_slice);
target_CTimgs = CTimgs(:,:,target_slice);
% Mask image is converted to binary
target_Predicted(target_Predicted>0) = 1;
target_GT(target_GT>0) = 1;
%%
GroundTruth_color = [1, 0, 0];
Predicted_color = [0, 0, 1];

figure, 
subplot(1,2,1), imshow(target_CTimgs, []), alphamask(target_GT, GroundTruth_color, 0.5)
title('Ground Truth')
subplot(1,2,2), imshow(target_CTimgs, []), alphamask(target_Predicted, Predicted_color, 0.5)
title('Predicted')
%%
figure()
imshow(target_CTimgs, []) , alphamask_three(target_GT,target_Predicted, GroundTruth_color, Predicted_color, 0.5)
title('Ground truth & Predicted mask')
%%
