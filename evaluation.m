 function y=evaluation(xx,data)
    for i=1:4
        data(:,i)=data(:,i).*xx(i);
    end
     
 obsv_n = size(data, 1);   
% Characteristics = {'Bikari','FM','pasanaz','ejare','bazneshastegi','Azad','Dolati','pousak','dokani','khoraki'};
% pairs = [1 2; 1 3; 1 4; 1 5; 1 6; 1 7; 1 8; 1 9; 1 10; 2 3; 2 4; 2 5; 2 6; 2 7; 2 8; 2 9; 2 10; 3 4; 3 5; 3 6; 3 7; 3 8; 3 9; 3 10;  4 5; 4 6; 4 7; 4 8; 4 9; 4 10;  5 6; 5 7; 5 8; 5 9; 5 10;  6 7; 6 8; 6 9; 6 10; 7 8; 7 9; 7 10; 8 9; 8 10; 9 10];
%h = figure;
% for j = 1:43
%     x = pairs(j, 1); 
%     y = pairs(j, 2);   
%     subplot(2,2,j);
%     plot([X1(:,x) X2(:,x)],...
%          [X1(:,y) X2(:,y)], '.');
%     xlabel(Characteristics{x},'FontSize',10); 
%     ylabel(Characteristics{y},'FontSize',10);
% end

 cluster_n = 2;
 max_iter = 100;
 expo = 2.0;
 min_impro = 1e-6;                      

U = initfcm(cluster_n, obsv_n);

        
% if ishghandle(h)
%     figure(h);
% else
%     for j = 1:43,
%         x = pairs(j, 1);
%         y = pairs(j, 2);
%         subplot(40,43,j);
%         %plot([X1(:,x) X2(:,x)],...
%              %[X1(:,y) X2(:,y)], '.');
%         xlabel(Characteristics{x},'FontSize',10);
%         ylabel(Characteristics{y},'FontSize',10);
%     end
% end
%iteration 
for i = 1:max_iter,
    [U, center, obj] = stepfcm(data, U, cluster_n, expo);
    fprintf('Iteration count = %d, obj. fcn = %f\n', i, obj);
%     refresh center
%      if i>1 && (abs(obj - lastobj) < min_impro)
%         for j = 1:43,
%              subplot(40,43,j);
%             for k = 1:cluster_n,
%                 text(center(k, pairs(j,1)), center(k,pairs(j,2)), int2str(k), 'FontWeight', 'bold');
%             end
%        end
%         break;
%     elseif i==1
%        for j = 1:43,
%             subplot(40,43,j);
%             for k = 1:cluster_n,
%                text(center(k, pairs(j,1)), center(k,pairs(j,2)), int2str(k), 'color',[0.5 0.5 0.5]);
%             end
%         end
%    end
%     lastobj = obj;
%  
end
maxU = max(U);% Group 1 rich and Group 2 poor

    y=sum(maxU);
   
end