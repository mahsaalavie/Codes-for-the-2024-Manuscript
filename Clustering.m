%%%%%%%%%%%%%%%%%%%FCM Clustering%%%%%%%%%%%%%%%%

data = xlsread("FSData.xlsx");

 for i = 2:4
   data(:,i) = data(:,i) ./ max(data(:,i));
 end

[center, U, obj_fcn] = fcm(data,2);

maxU = max(U);
IDX_FCM1 = find(U(1,:) == maxU);
IDX_FCM2 = find(U(2,:) == maxU);
cls(1,IDX_FCM1)=1;
cls(1,IDX_FCM2)=2;
save('fcm.Result.mat')
%%%%%%%%%%%%%%%Hierarcical Clustering%%%%%%%%%%%%%%%%
Y = pdist(data)
squareform(Y)
Z = linkage(Y,'ward');
c = cluster(Z,'Maxclust',2);
IDX_HC1 = find(c(:,1)==1);
IDX_HC2= find(c(:,1)==2);
cls(2, IDX_HC1)=1;
cls(2, IDX_HC2)=2;

%%%%%%%%%%%%%%%%CSPAHGPA Clustering%%%%%%%%%%%%%%%%

cl_HGPA= hgpa(cls,2); 
cl_CSPA = cspa(cls,2);
