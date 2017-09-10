clear;
clc;
%输入向量
P=[1.24	1.36 1.38 1.38 1.38 1.4 1.48 1.54 1.56 1.14 1.18 1.2 1.26 1.28 1.3;
    1.72 1.74 1.64 1.82 1.9 1.7 1.82 1.82 2.08 1.78 1.96 1.86 2.0 2.0 1.96];
%目标向量
T=[1 1 1 1 1 1 1 1 1 0 0 0 0 0 0];
%绘制输入向量
plotpv(P,T);
% 建立一个感知器
net=newp([0 3;0 3],1);
% 绘制输入向量
plotpv(P,T);
% 初始化感知器
net=init(net);
%画出分类线
net. iw {1,1}
net. b {1}
linehandle=plotpc(net.IW {1,1},net. b {1});   %作wx+b=0的分类线E=1;
E=1;
%修正感知器网络
while(sse(E))     %sse返回误差的平方
    [net,Y,E]=adapt(net,P,T);   %返回学习后的网络，Y是输出，E是误差
    linehandle=plotpc(net.IW{1},net.b{1},linehandle); %分界
    drawnow; %更新分界线
end


%利用训练好的感知器对未知类别样本进行分类
p=[1.24 1.28 1.4;1.8 1.84 2.04];
a=sim(net,p);
disp(a);
%plotpv(p,a);
%ThePoint=findobj(gca,'type','line');
%set(ThePoint,'Color','red');
%hold on
%plotpv(p,a);
%plotpc(net.IW{1},net.b{1});
%hold off;
%disp('End of percept');

