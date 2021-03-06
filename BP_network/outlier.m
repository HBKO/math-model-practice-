%进行异常值的检测和处理,行表示数据量，列表示维数（特征值）
%根据拉依达法则，（3cegema原则）
function result=outlier(data)
[r,c]=size(data);
avernum=mean(data);
%求标准差
cegema=zeros(1,10);
for i=1:c
    cegema(1,i)=std(data(:,i));
end

%处理异常值
for i=1:r
    for j=1:c
        if abs(data(i,j)-avernum(1,j))>3*cegema(1,j)
            data(i,j)=avernum(1,j);
        end
    end
end

result=data;
end