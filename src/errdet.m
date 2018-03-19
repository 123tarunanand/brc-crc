function z = errdet(data,pn)
%disp(data)
%disp(pn)
poly = uint32(hex2dec(pn)); %POLYNOMIAL BEING USED
%disp(poly)
k = dec2bin(poly);
%disp(k)
temp = data(1:length(k));
%disp(temp)
temp = uint32(bin2dec(temp));
z = floor(log2(double(poly)));

for i = length(k)+1:length(data)%START OF DIVISION
    %disp(dec2bin(temp))
   %disp(dec2bin(poly))
    if(temp>=2^z)%check if quotient is bigger than the polynomial
        temp = uint32(bitxor(temp, poly));%modulo 2 division using xor
    end
        %disp(dec2bin(temp))%display the remaining bits
        j = data(i);%BRINGING NEXT DIGIT IN
        k = dec2bin(temp);%converting to binary
        k = strcat(k,j);%concatenating the next bit to the binary version
        temp = uint32(bin2dec(k));%converting back to integer
    
end

% checking if the remainder is zero
% if the remainder is zero, return 0 i.e. no error detected
if(temp ==0)
    z = 0;
   % disp('Error not detected')
% if remainder isn't zero, there is an error, return 1 i.e. error detected
else
    z = 1;
    %disp('Error detected')
end
