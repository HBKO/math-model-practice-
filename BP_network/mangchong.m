clear;
clc;
%��������
P=[1.24	1.36 1.38 1.38 1.38 1.4 1.48 1.54 1.56 1.14 1.18 1.2 1.26 1.28 1.3;
    1.72 1.74 1.64 1.82 1.9 1.7 1.82 1.82 2.08 1.78 1.96 1.86 2.0 2.0 1.96];
%Ŀ������
T=[1 1 1 1 1 1 1 1 1 0 0 0 0 0 0];
%������������
plotpv(P,T);
% ����һ����֪��
net=newp([0 3;0 3],1);
% ������������
plotpv(P,T);
% ��ʼ����֪��
net=init(net);
%����������
net. iw {1,1}
net. b {1}
linehandle=plotpc(net.IW {1,1},net. b {1});   %��wx+b=0�ķ�����E=1;
E=1;
%������֪������
while(sse(E))     %sse��������ƽ��
    [net,Y,E]=adapt(net,P,T);   %����ѧϰ������磬Y�������E�����
    linehandle=plotpc(net.IW{1},net.b{1},linehandle); %�ֽ�
    drawnow; %���·ֽ���
end


%����ѵ���õĸ�֪����δ֪����������з���
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

