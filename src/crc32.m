function crc = crc32(data,pn) %FUNCTION TO CALCULATE CRC 32 CODE
% data is the data to be encoded
% pn is the polynomial used to encode the data
poly = uint32(hex2dec(pn)); %POLYNOMIAL BEING USED
k = dec2bin(poly);
f = dec2bin(data);
%disp(f)
data = double(data);
data = bitshift(data,31);%  ADDING 31 zeros
%disp(data)
data = dec2bin(data);
%disp(data)
temp = data(1:length(k));
temp = uint32(bin2dec(temp));
z = floor(log2(double(poly)));
for i = length(k)+1:length(data)%START OF DIVISION
   % disp(dec2bin(temp))
  % disp(dec2bin(poly))
    if(temp>=2^z)%check if quotient is bigger than the polynomial
        temp = uint32(bitxor(temp, poly));%modulo 2 division using xor
    end
 %       disp(dec2bin(temp))%display the remaining bits
        j = data(i);%BRINGING NEXT DIGIT IN
        k = dec2bin(temp);%converting to binary
        k = strcat(k,j);%concatenating the next bit to the binary version
        temp = uint32(bin2dec(k));%converting back to integer
    
end
temp = dec2bin(temp);
while(length(temp)<32)
    temp = strcat('0',temp);
end

f = strcat(f,temp);
crc = f;


