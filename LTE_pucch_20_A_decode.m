function decoded_bits = LTE_pucch_20_A_decode(rx_symbols, code_length)

permutation_for_20_A = [31, 0, 20, 1, 2, 21, 3, 4, ...
    22, 5, 6, 23, 7, 8, 9, 24, ...
    19, 25, 10, 11, 12, 13, 26, 27, ...
    14, 15, 28, 16, 17, 18, 29, 30] + 1;

rx_symbols_extended = [rx_symbols, zeros(1, 12)];

interleaved_symbols = rx_symbols_extended(permutation_for_20_A);

% load mask_matrix;

if code_length > 6
    
    load pucch_mask_matrix
    de_masked_matrix = interleaved_symbols .* pucch_mask_matrix;
%     A = de_masked_matrix * hadamard(32);
    
    A = zeros(128, 32);
    for ii = 1:128
        A(ii, :) = fast_hadamard_transform(de_masked_matrix(ii, :));
    end
    
else
    
%     A = interleaved_symbols * hadamard(32);

    A = fast_hadamard_transform(interleaved_symbols);
end

a = max(max(abs(A)));

[c, d] = find(abs(A) == a);

x_prime = bitget(d - 1, 1:5);

x_1 = double(A(c, d) > 0);

decoded_bits = [x_1, x_prime, bitget(c - 1, 7:-1:1)];

decoded_bits = decoded_bits(1:code_length);

end