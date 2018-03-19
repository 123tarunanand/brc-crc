function main()
  inps = 1;
  nums = zeros(1,inps,'double');
  % generate 1000 random integers and store them in an array
  for i = 1:inps
    nums(i)=data_gen();
  end 
  poly = {'01000000','01400000','10000001','18800000','0C000006','18000003','04C11DB7','00000103','00000022','747E9A33'};

  
  nbit = input('Enter upto what bit error to be analyzed\n');
  det_rate = zeros(4,nbit,'double');
  no = 0;
  for k = 1:nbit
    for i = 1:length(poly)
    disp('Current divisor is')
    disp(poly(i))
    for j = 1: length(nums)
      disp('Current input is ')
      disp(dec2bin(nums(j)))
     det_rate(floor(i),k) = CRC_gen(nums(j), poly(i),k);
    end
     end
  end
  det_rate
  bar(det_rate)
  set(gca,'XtickLabel',poly,'Xtick',1:numel(poly))
  l = cell(1,nbit);
  for  i = 1:nbit
      j = num2str(i);
      j = strcat(j,'-bit error');
      l{i} = j;
    
  end
  legend(l)
  