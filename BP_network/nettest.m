%����BP�������ѵ��
clear;
clc;
finaldata=importdata('finaldata.mat');
%ѡȡ1:400Ϊѵ�����ݣ�401��569Ϊ��������
p=finaldata(1:400,3:7)';
t=finaldata(1:400,2)';
net=newff([-2 1;-1 1;-1 1;-2 1;-2 1],[3 1],{'logsig' 'purelin'},'traingdx');
net.trainparam.show=100;%������ʾ֮���ѵ������
net.trainparam.lr=0.5; %ѧϰ��
net.trainparam.mc=0.8; %���Գ���
net.trainparam.epochs=100000;%��������
net.trainparam.goal=0.1; %ѵ��Ŀ��
[net,tr]=train(net,p,t);
Y=sim(net,p);
save BP_network/aaa net;