clear;
clc;
P=[0 1 2 3 4 5 6 7 8 9 10]; %输入向量
T=[0 1 2 3 4 3 2 1 2 3 4];%期望输出

%创建两层的BP网络：
net=newff([0 10], [5 1],{'tansig','purelin'});
%Y=sim(net,P); %输出仿真结果
%plot(P,T,P,Y,'o') %作图，未经过训练的结果
net.trainparam.show=50;     %每次循环50次
net.trainParam.epochs=500;   %最大循环500次
net.trainparam.goal=0.01;     %期望目标误差最小值
net=train(net,P,T);
Y=sim(net,P);
%Figure              %打开另外一个图形窗口
plot(P,T,P,Y,'o')   %作图，训练后的结果   
