function output = CRC_gen(data,pn,nbit)
output = 0;
sent = crc32(data,pn); %This is the input data plus CRC code which is transmitted
%disp('Sent data is')
%disp(sent)
  disp('Number of bit errors')
  disp(nbit)
  err_codes = err(sent,nbit); % get all possible error codes as a matrix
  f = 0;
  for j = 1:length(err_codes)
    err_code = err_codes(j,:);
   % disp('Received data is')
    %disp(err_code)
    output = output + errdet(err_code,pn);
    f= f+1;
  end
  output = output*100;
  output = output/f;