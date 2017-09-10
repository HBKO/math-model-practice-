%根据PCA进行数据降维处理
clear;
clc;
data=importdata('netdata.mat');
[pc,score,variance,t2]=princomp(data(:,3:12));
[r,c]=size(data);
finaldata=zeros(r,5);
%进行数据降维处理
for i=1:r
    for j=1:5
       for k=1:10
           finaldata(i,j)=finaldata(i,j)+data(i,k+2)*pc(j,k);
       end
    end
end

finaldata=[data(:,1:2) finaldata];
%disp(finaldata);
%保存数据
save BP_network/finaldata finaldata;

