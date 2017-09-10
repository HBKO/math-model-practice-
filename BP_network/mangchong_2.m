P=[1.24	1.36 1.38 1.38 1.38 1.4 1.48 1.54 1.56 1.14 1.18 1.2 1.26 1.28 1.3;
      1.72  1.74 1.64 1.82 1.9  1.7 1.82 1.82  2.08 1.78 1.96 1.86 2.0  2.0 1.96];
% 目标向量
T=[1 1 1 1 1 1 1 1 1 0 0 0 0 0 0];
plotpv(P,T);
% 建立一个感知器
net=newp([0 3;0 3],1);
%初始化感知器
net=init(net);
%设置神经网络的权重和偏重
net.iw{1,1}
net.b{1}
% 网络训练次数
net.adaptParam.passes=100;
net=adapt(net,P,T); %返回自适应的神经网络
% 输出仿真结果
Y=sim(net,P);
% 利用训练好的感知器进行分类
p=[1.24,1.28,1.4;1.8,1.84,2.04];
a=sim(net,p);
disp(Y);
disp(a);
