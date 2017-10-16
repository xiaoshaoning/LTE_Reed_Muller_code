function test_fht

N = 32;

x = rand(1, N);

y_1 = fwht(x, N, 'hadamard') * N;

y_2 = fast_hadamard_transform(x);

if norm(y_1 - y_2) < 0.0001
    disp('test passed.');
end