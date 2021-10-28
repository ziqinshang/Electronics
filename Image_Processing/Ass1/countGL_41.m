function y = countGL_41(im, v)
y = zeros(1,length(v)-1);
for i = 1:(length(v)-1)
    for j = 1:length(im(:))
        if (im(j)>=v(i) && im(j)<v(i+1))
            y(i)= y(i) + 1;
        end
    end
end
return

%type in the assignment1f to generate the graph
