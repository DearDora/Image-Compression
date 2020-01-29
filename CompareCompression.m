pic = imread('operahall.jpg');
operahall = im2double(pic);
tols = [0.00099 0.0052 0.014 0.027];

figure(1);
for i=1:4
    [img d] = Compress(operahall,tols(i));
    Y = img;
    subplot(2,2,i);
    imshow(Y);
    title(sprintf('Compressed by tol %f, with ratio %f',tols(i),d));
end

figure(2);
for i=1:4
    [img d] = Compress(operahall,tols(i));
    Z = im2double(pic) - img;
    subplot(2,2,i);
    imshow(abs(Z));
    title(sprintf('Compressed error by tol %f, with ratio %f',tols(i),d));
end