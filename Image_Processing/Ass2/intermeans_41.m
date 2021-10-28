function thres=intermeans_41(im)

%convert image to histogram
histinput=imhist(im);
histinput=histinput.';

%estimate first T value, by taking average of first non-zero H(D) and last
%non-zero H(D)
Tmin=0;
Tmax=255;
%find the first non-zero element in the first part
i=1;
while true
    if(histinput(i)==0)
        i=i+1;
    else 
        Tmin=i;
        break;        
    end
end
%find the last non-zero element in the last part
i=255;
while true
    if(histinput(i)==0)
        i=i-1;
    else 
        Tmax=i;
        break;        
    end
end
%find the average 
T=round((Tmin+Tmax)/2);

while true    
%calculate average of both parts
hist1=histinput(1:T);
hist2=histinput(T+1:end);

%calculate average using formula given
hist1upper=sum((0:T-1).*hist1);
u1=hist1upper/(sum(hist1));

hist2upper=sum((T:255).*hist2);
u2=hist2upper/(sum(hist2));

%average of two parts
Tnew=round((u1+u2)/2);

%keeps looping until two consecutive round has same threshold 
if(T==Tnew)
    break;
else 
    T = Tnew;
end

end

%return the calculate threshold
disp(T);
thres=T;

end


