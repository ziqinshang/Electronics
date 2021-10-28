w = -pi:0.01:pi;
y = zeros(1, length(w));
%for loop that loops for the length of w
for k = 1 : length(w)
    for i= 1: 11 
        %equation for x interval
        y(k)= y(k)+ exp(-1j * w(k) *i ); 
    end
end
abs(y);
plot(w,abs(y));
