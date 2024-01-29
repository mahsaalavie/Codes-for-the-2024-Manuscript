data = xlsread("FSData.xlsx");

for i=2:4
    data(:,i) = data(:,i)./ max(data(:,i));
end

E1 = evalclusters(data,'kmeans','DaviesBouldin','klist',[1:10]);
E = evalclusters(data,'kmeans','silhouette','klist',(1:10));
figure;
plot(E1)