function [layer1	,layer2	,layer3	,layer4	,layer5	,layer6	,layer7	,layer8	,layer9	,layer10	,sigma	,mu	,skew	,kurt]=netw(data,output,hidden)
nodes=round((sqrt((4.*sqrt(numel(data)./2)*hidden)+1)+1)/(2*hidden));
[x,y]=size(data); %#ok<ASGLU>
[w,l]=size(output); %#ok<ASGLU>
layer1=rand(y,nodes)*(hidden>1);
layer2=rand(nodes,nodes)*(hidden>2);
layer3=rand(nodes,nodes)*(hidden>3);
layer4=rand(nodes,nodes)*(hidden>4);
layer5=rand(nodes,nodes)*(hidden>5);
layer6=rand(nodes,nodes)*(hidden>6);
layer7=rand(nodes,nodes)*(hidden>7);
layer8=rand(nodes,nodes)*(hidden>8);
layer9=rand(nodes,nodes)*(hidden>9);
layer10=rand(nodes,l)*(hidden>10);



llayer1=data*layer1;
llayer2=llayer1*layer2+(hidden<=2)*(llayer1);
llayer3=llayer2*layer3+(hidden<=3)*(llayer2);
llayer4=llayer3*layer4+(hidden<=4)*(llayer3);
llayer5=llayer4*layer5+(hidden<=5)*(llayer4);
llayer6=llayer5*layer6+(hidden<=6)*(llayer5);
llayer7=llayer6*layer7+(hidden<=7)*(llayer6);
llayer8=llayer7*layer8+(hidden<=8)*(llayer7);
llayer9=llayer8*layer9+(hidden<=9)*(llayer8);
llayer10=llayer9*layer10+(hidden<=10)*llayer9*ones(nodes,l);
series=sign(llayer10).*output;
sigma=std(series);
mu=mean(series);
skew=skewness(series);
kurt=kurtosis(series);
    


