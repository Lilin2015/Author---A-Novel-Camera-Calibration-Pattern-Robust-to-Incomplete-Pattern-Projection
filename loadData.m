clc;clear;close all;

addpath('./detect/');

filePath = '.\data\1520\';
cameraMAC = ['a4';'a5';'a6';'a7';'a9';'ab';'ac'];
data = [];
for i = 1:1:size(cameraMAC,1)
    dataCapture = dir( strcat(filePath,cameraMAC(i,:),'\*.jpg') );
    data = [data;dataCapture'];
end
[camNum, picNum] = size(data);

clearvars dataCapture i;
