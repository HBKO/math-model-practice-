%�����쳣ֵ�ļ��ʹ���,�б�ʾ���������б�ʾά��������ֵ��
%���������﷨�򣬣�3cegemaԭ��
function result=outlier(data)
[r,c]=size(data);
avernum=mean(data);
%���׼��
cegema=zeros(1,10);
for i=1:c
    cegema(1,i)=std(data(:,i));
end

%�����쳣ֵ
for i=1:r
    for j=1:c
        if abs(data(i,j)-avernum(1,j))>3*cegema(1,j)
            data(i,j)=avernum(1,j);
        end
    end
end

result=data;
end