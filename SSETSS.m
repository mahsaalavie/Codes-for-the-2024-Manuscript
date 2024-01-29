
load("NMIARITest.Result.mat");
% load("GAClustering.mat")
% 
%SeprateClusterIndexCSPA%%

C1=transpose(find(cl_CSPA(1,:)==1));
C2= transpose(find(cl_CSPA(1,:)==2));

% % % SeprateClusterIndexHGPA%%

H1= transpose(find(cl_HGPA(1,:)==1));
H2= transpose(find(cl_HGPA(1,:)==2));

%DataCSPACluses%%

Data_CSPA1 = data(IDX_CSPA1,:);
Data_CSPA2 = data(IDX_CSPA2,:);

%DataHGPACluses%%

Data_HGPA1 = data(IDX_HGPA1,:);
Data_HGPA2 = data(IDX_HGPA2,:);


%DataGACluses%%

Data_GA1 = data(IDX_GA1,:);
Data_GA2 = data(IDX_GA2,:);

%Finding Centers of CSPA%%

Center_CSPA(1,1) = mean(Data_CSPA1(:,1));
Center_CSPA(1,2) = mean(Data_CSPA1(:,2));
Center_CSPA(1,3) = mean(Data_CSPA1(:,3));
Center_CSPA(1,4) = mean(Data_CSPA1(:,4));
Center_CSPA(2,1) = mean(Data_CSPA2(:,1));
Center_CSPA(2,2) = mean(Data_CSPA2(:,2));
Center_CSPA(2,3) = mean(Data_CSPA2(:,3));
Center_CSPA(2,4) = mean(Data_CSPA2(:,4));

%Finding Centers of HGPA%%
% 
Center_HGPA(1,1) = mean(Data_HGPA1(:,1));
Center_HGPA(1,2) = mean(Data_HGPA1(:,2));
Center_HGPA(1,3) = mean(Data_HGPA1(:,3));
Center_HGPA(1,4) = mean(Data_HGPA1(:,4));
Center_HGPA(2,1) = mean(Data_HGPA2(:,1));
Center_HGPA(2,2) = mean(Data_HGPA2(:,2));
Center_HGPA(2,3) = mean(Data_HGPA2(:,3));
Center_HGPA(2,4) = mean(Data_HGPA2(:,4));


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%SSE for CSPA%%

Sum_CSPA1 = 0;
for i = 1:9442
    for j= 1:4
        Sum_CSPA1 = Sum_CSPA1 + (Data_CSPA1(i, j)- Center_CSPA(1, j))^2
    end

end


Sum_CSPA2 = 0;
for i = 1:9443
    for j= 1:4
        Sum_CSPA2 = Sum_CSPA2 + (Data_CSPA2(i, j)- Center_CSPA(2, j))^2
    end

end
SSE_CSPA = Sum_CSPA1 +  Sum_CSPA2;

%%SSB for CSPA%%

C_Center_CSPA(1,1) = mean (Center_CSPA(:,1));
C_Center_CSPA(1,2) = mean (Center_CSPA(:,2));
C_Center_CSPA(1,3) = mean (Center_CSPA(:,3));
C_Center_CSPA(1,4) = mean (Center_CSPA(:,4));

Sumation_CSPA = [0 ; 0];
for i = 1:2
    for j= 1:4
       Sumation_CSPA(i,:)= Sumation_CSPA(i,:) + (C_Center_CSPA(1,j) - Center_CSPA(i,j))^2
    end

    if i==1
        temp = size(Data_CSPA1,1);
    elseif i==2
        temp = size(Data_CSPA2,1);
    end
    Sumation_CSPA(i,1) = Sumation_CSPA(i,1)* temp;  
end

SSB_CSPA =   Sumation_CSPA (1,1) +  Sumation_CSPA (2,1);


%%Tss CSPA%%
TSS_CSPA = SSB_CSPA + SSE_CSPA;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%%SSE for HGPA%%
 Sum_HGPA1 = 0;
for i = 1:9442
    for j= 1:4
        Sum_HGPA1 =  Sum_HGPA1 + (Data_HGPA1(i, j)- Center_HGPA(1, j))^2
    end
end


Sum_HGPA2 = 0;
for i = 1:9443
    for j= 1:4
        Sum_HGPA2 = Sum_HGPA2 + (Data_HGPA2(i, j)- Center_HGPA(2, j))^2
    end

end
 SSE_HGPA = Sum_HGPA1 + Sum_HGPA2


 %%SSB for HGPA%%

C_Center_HGPA(1,1) = mean (Center_HGPA(:,1));
C_Center_HGPA(1,2) = mean (Center_HGPA(:,2));
C_Center_HGPA(1,3) = mean (Center_HGPA(:,3));
C_Center_HGPA(1,4) = mean (Center_HGPA(:,4));

Sumation_HGPA = [0 ; 0];
for i = 1:2
    for j= 1:4
        Sumation_HGPA(i,1)=Sumation_HGPA(i,1) + (C_Center_HGPA(1,j) - Center_HGPA(i,j))^2
    end
    if i==1
        temp = size(Data_HGPA1,1);
    elseif i==2
        temp = size(Data_HGPA2,1);
    end
    Sumation_HGPA(i,1) = Sumation_HGPA(i,1) * temp;  
 end
SSB_HGPA =   Sumation_HGPA (1,1) +  Sumation_HGPA (2,1);

%%Tss HGPA%%
TSS_HGPA = SSB_HGPA + SSE_HGPA;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 
%SSE for GA%%

 Sum_GA1 = 0;

for j = 1:2572
    for j= 1:4
        Sum_GA1 = Sum_GA1 + (Data_GA1(i, j)- center_GA(1, j))^2
    end
end
TempGA1 = 0
 Sum_GA2 = 0;
for i = 1:16313
    for j= 1:4
         Sum_GA2 =  Sum_GA2 + (Data_GA2(i, j)- center_GA(1, j))^2
    end

end

 SSE_GA = Sum_GA1 + Sum_GA2

 %%SSB for GA%%

C_center_GA(1,1) = mean (center_GA(:,1));
C_center_GA(1,2) = mean (center_GA(:,2));
C_center_GA(1,3) = mean (center_GA(:,3));
C_center_GA(1,4) = mean (center_GA(:,4));
 Sumation_GA = [0 ; 0];
for i = 1:2
    for j= 1:4
        Sumation_GA(i,1)= Sumation_GA(i,1) + (C_center_GA(1,j) - center_GA(i,j))^2
    end
    if i==1
        temp = size(Data_GA1,1);
    elseif i==2
        temp = size(Data_GA2,1);
    end
    Sumation_GA(i,1) = Sumation_GA(i,1) * temp;  
 end
SSB_GA =   Sumation_GA (1,1) +  Sumation_GA (2,1);


%%Tss GA%%
TSS_GA = SSB_GA + SSE_GA;


save("TSS_Test.mat");


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
SSE for FCM%%
Data_FCM1 = data(IDX_FCM1,:);
Data_FCM2 = data(IDX_FCM2,:);

 Sum_FCM1 = 0;

for j = 1:2782
    for j= 1:4
        Sum_FCM1 = Sum_FCM1 + (Data_FCM1(i, j)- center(1, j))^2
    end
end
TempFCM1 = 0
 Sum_FCM2 = 0;
for i = 1:16103
    for j= 1:4
         Sum_FCM2 =  Sum_FCM2 + (Data_FCM2(i, j)- center(1, j))^2
    end

end
 
 SSE_FCM = Sum_FCM1 + Sum_FCM2
 
 %SSB for GA%%
 
C_center_FCM(1,1) = mean (center(:,1));
C_center_FCM(1,2) = mean (center(:,2));
C_center_FCM(1,3) = mean (center(:,3));
C_center_FCM(1,4) = mean (center(:,4));
 Sumation_FCM = [0 ; 0];
for i = 1:2
    for j= 1:4
        Sumation_FCM(i,1)= Sumation_FCM(i,1) + (C_center_FCM(1,j) - center(i,j))^2
    end
    if i==1
        temp = size(Data_FCM1,1);
    elseif i==2
        temp = size(Data_FCM2,1);
    end
    Sumation_FCM(i,1) = Sumation_FCM(i,1) * temp;  
 end
SSB_FCM =   Sumation_FCM (1,1) +  Sumation_FCM (2,1);


%Tss GA%%
TSS_FCM = SSB_FCM + SSE_FCM;


save("TSS_Test.mat");
 