%����Ԥ����
clear;
clc;
data=load('/Users/hekewen/Desktop/data.mat');
truedata=data.data;
%�Ƚ����Ե����ݼ�ȥ��Ӧ���ֵ���õ������ֵ�Ľ��
%��1��200�����ݵ���ѵ�����ݣ�201��569������������
result=truedata(:,1:22);
for i=3:12
    result(:,i)=truedata(:,i+20)-truedata(:,i);
end

%�����ݵı�׼ֵ���й�һ������,���ݹ�һ����0��1
%��һ����ı�׼ֵԽ�ӽ�1˵�����ݵ�ƫ��Խ����Խ�����ţ���Ӧ�ý�ǰ��õ��Ĳ�ֵ���Ա�׼��ĵ���
for i=13:22
    [test,PS]=mapminmax(result(:,i)',0,1);
    result(:,i)=test';
end

%for i=3:12
%    result(:,i)=result(:,i)*(1/result(:,i+10));
%end

for i=1:569
    for j=3:12
        %��ֹ��0����
        if result(i,j+10)==0
            result(i,j+10)=0.01;
        end
        result(i,j)=result(i,j)*(1/result(i,j+10));
    end
end
%disp(result(:,3:12));

%���������ݽ����쳣ֵ�޳�
result(:,3:12)=outlier(result(:,3:12));
%���������ݽ��й�һ������
for i=3:12
    [test,PS]=mapminmax(result(:,i)',-1,1);
    result(:,i)=test';
end
%��������
save BP_network/netdata result;