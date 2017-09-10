finaldata=importdata('finaldata.mat');
p=finaldata(1:400,3:7)';
net=importdata('aaa.mat');
count=0;
Y=sim(net,p);
[r,c]=size(Y);
for i=1:c
    if Y(i)>=1.5187
        Y(i)=2;
    else
        Y(i)=1;
    end
end

for i=1:c
    if Y(i)==finaldata(i,2)
        count=count+1;
    end
end
disp(count/400);
p=finaldata(401:569,3:7)';
count=0;
T=sim(net,p);
[r,c]=size(T);
for i=1:c
    if T(i)>=1.5187
        T(i)=2;
    else
        T(i)=1;
    end
end

for i=1:c
    if T(i)==finaldata(i+400,2)
        count=count+1;
    end
end
disp(count/c);
