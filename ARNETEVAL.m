function [maxloc,maxprob,maxmu,maxstat,layer1	,layer2	,layer3	,layer4	,layer5	,layer6	,layer7	,layer8	,layer9	,layer10	,sigma	,mu	,skew	,kurt]=ntw2(data,output,hidden)
% An Autoregressive net built for finance and protected from overfitting. Maximum Sharpe Ratio Strategy
for i=1:20000;
        [llayer1	,llayer2	,llayer3	,llayer4	,llayer5	,llayer6	,llayer7	,llayer8	,llayer9	,llayer10	,sigma(i,:)	,mu(i,:)	,skew(i,:)	,kurt(i,:)]=netw(data,output,hidden); %#ok<AGROW>
        sharpes=mu./sigma;
         n1=(1-(1/i));
        n2=(1-(.36787/i));
        a1=norminv(n1,0,1);
        a2=norminv(n2,0,1);
        kiz=.48*a1+.52*a2;
        [a,b]=size(sharpes); %#ok<ASGLU>
        vsharpes=repmat(std(sharpes).*kiz,a,1);
        osharpes=((sharpes-vsharpes)*15.587)./sqrt((1-(skew.*sharpes))+(((kurt-1)./4).*sharpes));
        prob=((cdf('normal',osharpes,0,1)).^3).*mu;
        check1=max(max(prob')'); %#ok<UDIM>
        check2=(max(prob')'); %#ok<UDIM>
        butler1=max(max(mu));
        butler2=max(max((cdf('normal',osharpes,0,1))));
        if check2(end,end)>=check1
            layer1=llayer1;
            layer2=llayer2;
            layer3=llayer3;
            layer4=llayer4;
            layer5=llayer5;
            layer6=llayer6;
            layer7=llayer7;
            layer8=llayer8;
            layer9=llayer9;
            layer10=llayer10;
            maxloc=i;
            maxmu=butler1;
            maxprob=butler2;
            maxstat=check2(end,end);
            disp(check2(end,end));
            disp(i);
            disp(butler1);
            disp(butler2);
        end

    end
        
