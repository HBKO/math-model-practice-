clear;
clc;
P=[0 1 2 3 4 5 6 7 8 9 10]; %��������
T=[0 1 2 3 4 3 2 1 2 3 4];%�������

%���������BP���磺
net=newff([0 10], [5 1],{'tansig','purelin'});
%Y=sim(net,P); %���������
%plot(P,T,P,Y,'o') %��ͼ��δ����ѵ���Ľ��
net.trainparam.show=50;     %ÿ��ѭ��50��
net.trainParam.epochs=500;   %���ѭ��500��
net.trainparam.goal=0.01;     %����Ŀ�������Сֵ
net=train(net,P,T);
Y=sim(net,P);
%Figure              %������һ��ͼ�δ���
plot(P,T,P,Y,'o')   %��ͼ��ѵ����Ľ��   
