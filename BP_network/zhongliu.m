%数据预处理
clear;
clc;
data=load('/Users/hekewen/Desktop/data.mat');
truedata=data.data;
%先将测试的数据减去相应的最坏值，得到距离最坏值的结果
%将1：200的数据当作训练数据，201：569当作测试数据
result=truedata(:,1:22);
for i=3:12
    result(:,i)=truedata(:,i+20)-truedata(:,i);
end

%对数据的标准值进行归一化处理,数据归一化在0～1
%归一化后的标准值越接近1说明数据的偏差越到，越不可信，故应该将前面得到的差值乘以标准差的倒数
for i=13:22
    [test,PS]=mapminmax(result(:,i)',0,1);
    result(:,i)=test';
end

%for i=3:12
%    result(:,i)=result(:,i)*(1/result(:,i+10));
%end

for i=1:569
    for j=3:12
        %防止除0错误
        if result(i,j+10)==0
            result(i,j+10)=0.01;
        end
        result(i,j)=result(i,j)*(1/result(i,j+10));
    end
end
%disp(result(:,3:12));

%对现有数据进行异常值剔除
result(:,3:12)=outlier(result(:,3:12));
%对现有数据进行归一化处理
for i=3:12
    [test,PS]=mapminmax(result(:,i)',-1,1);
    result(:,i)=test';
end
%保存数据
save BP_network/netdata result;