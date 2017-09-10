%进行BP神经网络的训练
clear;
clc;
finaldata=importdata('finaldata.mat');
%选取1:400为训练数据，401：569为测试数据
p=finaldata(1:400,3:7)';
t=finaldata(1:400,2)';
net=newff([-2 1;-1 1;-1 1;-2 1;-2 1],[3 1],{'logsig' 'purelin'},'traingdx');
net.trainparam.show=100;%两次显示之间的训练步数
net.trainparam.lr=0.5; %学习率
net.trainparam.mc=0.8; %惯性常数
net.trainparam.epochs=100000;%迭代次数
net.trainparam.goal=0.1; %训练目标
[net,tr]=train(net,p,t);
Y=sim(net,p);
save BP_network/aaa net;