I= imread('peppers.png');
disp(I(1:5, 1:5, 1));
disp(I(1:5, 1:5, 2));
disp(I(1:5, 1:5, 3));

figure();imshow(I);
title('Original Image');

I_bright = im2double(I) * 1.25;
I_bright(I_bright > 1) = 1;
figure();imshow(I_bright);
title('Brightened Image');

I_dark = im2double(I) * 0.75;
figure();imshow(I_dark);
title('Darkened Image');

I_resized = imresize(I, [100 100]);
figure();imshow(I_resized);
title('Resized Image (100x100)');

rows = size(I, 1);
cols = size(I, 2);
topQuarter = I(1:floor(rows/2), 1:floor(cols/2), :);
figure();imshow(topQuarter);
title('Top-Left Quarter of Image');

Igray = rgb2gray(I);
figure();imshow(Igray);
title('Grayscale Image');

Iseg = Igray;
Iseg(Iseg >= 100) = 255;
Iseg(Iseg < 100) = 0;
figure();imshow(Iseg);
title('Segmented Grayscale Image');

Iseg = I;
mask = Iseg >= 100;
Iseg(mask) = 255;
Iseg(~mask) = 0;
figure();imshow(Iseg);
title('Segmented Color Image');

I = imread('lighthouse.png');
figure();imshow(I);

I_red = detectColour(I, 1);
figure();imshow(I_red);

I_green = detectColour(I, 2);
figure();imshow(I_green);

I_blue = detectColour(I, 3);
figure();imshow(I_blue);

function I_detected = detectColour(im, channel)
threshold = 175;
I_detected = zeros(size(im), 'uint8');
rows = size(im, 1);
columns = size(im, 2);
for i = 1:rows
    for j = 1:columns
        if im(i,j,channel) > threshold
            I_detected(i,j,channel) = 255;
        else
            I_detected(i,j,channel) = 0;
        end
    end
end
end

I = imread('peppers.png');
figure();imshow(I);

I_red = I;
I_red(I_red(:,:,1) < 128) = 0;
figure();imshow(I_red);

I_red(:,:,2:3) = 0;
figure();imshow(I_red);

I = imread('coins.png');
figure();imshow(I);

BW1 = edge(I,'sobel');
BW2 = edge(I,'canny');
figure();imshowpair(BW1,BW2,'montage')
title('Sobel Filter Canny Filter');

I = imread('peppers.png');
I(1:15, 1:15, 1)
figure();imshow(I);

Igray = rgb2gray(I);
figure();imshow(diff(Igray));

Iedge = diff(Igray);
threshold_value = 7;
Iedge(Iedge>=threshold_value) = 255;
Iedge(Iedge<threshold_value) = 0;
figure();imshow(Iedge)

BW1 = edge(Igray,'sobel');
BW2 = edge(Igray,'canny');
figure();imshowpair(BW1,BW2,'montage')
title('Sobel Filter       Canny Filter','FontSize',19)