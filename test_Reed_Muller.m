function test_Reed_Muller(varargin)

if nargin == 0
    code_length = 11;
else
    code_length = varargin{1};
end

if code_length > 11
    disp('code length is forced to be 11.');
    code_length = 11;
end

x = randi([0, 1], 1, code_length);

disp(x);

y = LTE_Reed_Muller_encode(x);

tx_symbols = 1 - 2 * y;

decoded_bits = LTE_Reed_Muller_decode(tx_symbols, code_length);

disp(decoded_bits);

if isequal(decoded_bits, x)
    disp('test passed.');
else
    disp('test failed.');
end

end