%%%%%%%%%%%%%%%%Purity CSPA%%%%%%%%%%%%%%%%%%%%%%%%%
load("CSPAHGPA.Result.mat")
DATA =data
X1=find(data(:,1) >=mean(data(:,1)) & ...
     data(:,2) <= mean(data(:,2)) & ...
     data(:,3) <= mean(data(:,3)) & ...
     data(:,4) <= mean(data(:,4)))
 DATA(X1,5)=1;
 X2=find(DATA(:,5)==0);
 DATA(X2,5)=2;

CL_CSPA = transpose (cl_CSPA);
IDX_CSPA1 = find(CL_CSPA(:,1)==1);
IDX_CSPA2 = find(CL_CSPA(:,1)==2);

DATA(IDX_CSPA1,6)=1;
DATA(IDX_CSPA2,6)=2;

clust11_CSPA=find(DATA(:,5)==1 & DATA(:,6)==1); 
clust12_CSPA=find(DATA(:,5)==1 & DATA(:,6)==2);
clust21_CSPA=find(DATA(:,5)==2 & DATA(:,6)==1);
clust22_CSPA=find(DATA(:,5)==2 & DATA(:,6)==2);

Purity_CSPA = (size(clust11_CSPA) + size(clust22_CSPA)) ./ (size(clust11_CSPA) +  size(clust12_CSPA) + size(clust21_CSPA) + size(clust22_CSPA));

%%%%%%%%%%%%%%%%%Purity HGPA%%%%%%%%%%%%%%%%%%%%%%%%%
 
CL_HGPA = transpose (cl_HGPA);
IDX_HGPA1 = find(CL_HGPA(:,1)==1);
IDX_HGPA2 = find(CL_HGPA(:,1)==2);

DATA(IDX_HGPA1,7)=1;
DATA(IDX_HGPA2,7)=2;

clust11_HGPA=find(DATA(:,5)==1 & DATA(:,7)==1);
clust12_HGPA=find(DATA(:,5)==1 & DATA(:,7)==2);
clust21_HGPA=find(DATA(:,5)==2 & DATA(:,7)==1);
clust22_HGPA=find(DATA(:,5)==2 & DATA(:,7)==2); 

Purity_HGPA = (size(clust11_HGPA) + size(clust22_HGPA)) ./ (size(clust11_HGPA) +  size(clust12_HGPA) + size(clust21_HGPA) + size(clust22_HGPA));
 
%%%%%%%%%%%%%%%%%%Purity GA%%%%%%%%%%%%%%%%%%%%%%%%%

load("GA.mat");
 Data = data;
 for i=1:4
        Data(:,i)=Data(:,i)./max(Data(:,i));
        Data(:,i)=Data(:,i).* best.x(i);
 end

[center_GA,U,obj_fcn]=fcm(Data,2);
maxU = max(U);
IDX_GA1=find(U(1,:)==maxU);
IDX_GA2=find(U(2,:)==maxU);

DATA(IDX_GA1,8)=1;
DATA(IDX_GA2,8)=2;

clust11_GA=find(DATA(:,5)==1 & DATA(:,8)==1);
clust12_GA=find(DATA(:,5)==1 & DATA(:,8)==2); 
clust21_GA=find(DATA(:,5)==2 & DATA(:,8)==1);
clust22_GA=find(DATA(:,5)==2 & DATA(:,8)==2);

Purity_GA = (size(clust11_GA) + size(clust22_GA)) ./ (size(clust11_GA) +  size(clust12_GA) + size(clust21_GA) + size(clust22_GA));

%%%%%%%%%%%%%%%%%%Purity FCM%%%%%%%%%%%%%%%%%%%%%%%%%
 
DATA(IDX_FCM1,9)= 1;
DATA(IDX_FCM2,9)= 2;

clust11_FCM = find(DATA(:,5)==1 & DATA(:,9)==1); 
clust12_FCM = find(DATA(:,5)==1 & DATA(:,9)==2);
clust21_FCM = find(DATA(:,5)==2 & DATA(:,9)==1);
clust22_FCM = find(DATA(:,5)==2 & DATA(:,9)==2);

Purity_FCM = (size(clust11_FCM) + size(clust22_FCM)) ./ (size(clust11_FCM) +  size(clust12_FCM) + size(clust21_FCM) + size(clust22_FCM));
save("PurityTest.Result.mat")
