function [Y,drop] = Compress(X,tol)
    Y = zeros(size(X));
    [M,N] = size(X);
    count =0;
    submat = 32;
    for i=0:((M/submat)-1)
        for j=0:((N/submat)-1)
            l = submat*i+1;
            r = min(M,l+submat-1);
            top = submat*j+1;
            bottom = min(N,top+submat-1);
            block = X(l:r,top:bottom);
            F = fft2(block);
            maxF = max(abs(F(:)));
            k = abs(F)<=(maxF*tol);
            count = count + sum(k(:));
            F(k) = 0;
            compressed = real(ifft2(F));
            Y(l:r,top:bottom) = compressed;
        end
    end
    drop = count/length(X(:));
end