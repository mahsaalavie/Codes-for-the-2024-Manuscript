function GAFirst()

 data= xlsread('FSData.xlsx');
  for i=2:4
    data(:,i)=data(:,i)./max(data(:,i));
  end

 pop.x=[];        
 pop.fit=0;       
 global nfe;
 nfe=0;
 popAll=repmat(pop,[300,1]);
  for i=1:300
     popAll(i).x=unifrnd(-1,1,[1,4]);               
     popAll(i).fit=evaluation(popAll(i).x,data); 
  end
 popCross=pop;
 popMut=pop;
 clear pop;
 best=popAll(1);  
 best.fit=0;
  for i=1:length(popAll)
      if popAll(i).fit>best.fit
          best=popAll(i);
      end
  end
 mutRange=0.1;
 numIter=100;
 bestEval(1)=evaluation(ones(1,4),data);
  for iter=2:numIter
     popAll=popAll(randperm(length(popAll)));
     clear popMut popCross;
     for i=1:0.3*length(popAll)
         popMut(i)=popAll(i);
         j=randi(4,1,floor(0.25*4));
         for k=1:length(j)
             popMut(i).x(j(k))=popMut(i).x(j(k))+mutRange*randn();
         end
         popMut(i).fit=evaluation(popMut(i).x,data);
         if popMut(i).fit>best.fit
             best=popMut(i);
         end
    end
%     for i=1:0.4*length(popAll)
%          z=randi(4);
%          popCross(i).x(1:z)=popAll(i).x(1:z);
%          popCross(i).x(z+1:4)=popAll(i+0.4*length(popAll)).x(z+1:4);
%          popCross(i+0.4*length(popAll)).x(1:z)=popAll(i+0.4*length(popAll)).x(1:z);
%          popCross(i+0.4*length(popAll)).x(z+1:4)=popAll(i).x(z+1:4);
%          popCross(i).fit=evaluation(popCross(i).x,data);
%          popCross(i+0.4*length(popAll)).fit=evaluation(popCross(i+0.4*length(popAll)).x,data);
%          if popCross(i).fit>best.fit
%              best=popCross(i);
%          end
%          if popCross(i+0.4*length(popAll)).fit>best.fit
%              best=popCross(i+0.4*length(popAll));
%          end
%     end
%     
%      popAll=sortCell(popAll);
%      popMut=sortCell(popMut);
%      popCross=sortCell(popCross);
%      bestEval(iter)=best.fit;
%      nfeNumber(iter)=nfe;
%      popAll(151:240)=popCross(1:90);
%      popAll(241:300)=popMut(1:60);
%      save('best.mat','best');
%   end
load("GA.mat")
 plot(bestEval);
 title('Fitness Function Value')
 xlabel('Iteration Count')
 ylabel('Fitness Function Value')

 save('best.mat','best');
 save('GA');    
% plot(nfeNumber,bestEval,'r');
dlmwrite('bestEval1.txt',bestEval,'-append'); 
dlmwrite('nfeNumber1.txt',nfeNumber,'-append'); 
% legend('crossOverOnePoint');
 function arrayIn=sortCell(arrayIn)
    for ii=1:length(arrayIn)
         Max=arrayIn(ii).fit;
         index=ii;
         for jj=ii+1:length(arrayIn)
             if arrayIn(jj).fit >Max
                  Max= arrayIn(jj).fit;
                  index=jj;
             end
         end
         test1=arrayIn(index);
         arrayIn(index)=arrayIn(ii);
         arrayIn(ii)=test1;
    end
 end
end 