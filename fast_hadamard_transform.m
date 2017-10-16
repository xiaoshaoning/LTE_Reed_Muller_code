function y = fast_hadamard_transform(x)

t = length(x);

if 2^floor(log2(t)) ~= t
    error('length of input vector shall be of a power of two');
end

y = zeros(size(x));

if t == 2
  y(1) = x(1) + x(2);
  y(2) = x(1) - x(2);
else
  t_over_2 = t/2;  
  z = zeros(size(x));
  for index = 1:t_over_2
    z(index) = x(index) + x(index + t_over_2);    
    z(index+t_over_2) = x(index) - x(index + t_over_2);
  end
  
  y(1:t_over_2) = fast_hadamard_transform(z(1:t_over_2));
  y((1+t_over_2):t) = fast_hadamard_transform(z((1+t_over_2):t));
  
end

end