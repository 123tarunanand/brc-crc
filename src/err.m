function ret = err(code, n)
% err.m is for introducing errors into the code
% data = data to which error needs to be introduced
% pn = polynomial 
% n = number of bits of error to be introduced
%disp(code)
%code = '1012';
%n = 2
copy = code;
err_words = '';
C = nchoosek(1:length(code), n);
for j = 1:length(C)
  code = copy;
  choice = C(j,:);
  for i = 1:length(choice)
    pos = choice(i);
    if code(pos) == '1'
      code(pos) = '0';
    else
      code(pos) = '1';
    end
  end
  err_words = [err_words;code];
end
length(err_words);
ret = err_words;