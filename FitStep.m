data = xlsread("datafit.xlsx")
for i=2:4
    data(:,i) = data(:,i)./max(data(:,i))
end
%  mdl = fitlm(data(:,1:4),data(:,5),'linear')
% mdl=LinearModel.stepwise(data(:,1:4),data(:,5),'PEnter',0.05)

[B, Bint, R, Rint, stats]=regress(data(:,5),data(:,1:4))
rcoplot(R, Rint)
polytool(data(:,1:4),data(:,5))
% y = 1 + x1 .* x2 + x1 .* x4 + x2 .* x3
% scatter(x,y)
% xlabel('x')
% ylabel('y')



