function test_FHT

% H_2 = [1, 1; 1, -1];
% H_4 = kron(H_2, H_2);
% H_8 = kron(H_4, H_2);
% H_16 = kron(H_8, H_2);
% 
% disp(H_16);

H_32 = hadamard(32);

x = rand(1, 32);

y = 32 * fwht(x, 32, 'hadamard');

y_prime = x * H_32;

disp(y_prime ./ y);

end