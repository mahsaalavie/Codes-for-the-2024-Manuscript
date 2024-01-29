 data = xlsread("FinalData.xlsx");
 data = data(:,2:11);
 for i=2:10
 data(:,i) = data(:,i) ./ max(data(:,i));
 end
 [center , U , obj_fcn] = fcm(data,2);
 maxU = max(U);
 index1 = find(U(1,:)==maxU);
 index2 = find(U(2,:)==maxU);

data(index1,11)=0;
data(index2,11)=1;
mdl = stepwiselm(data(:,1:10),data(:,11),'PEnter',0.05)
