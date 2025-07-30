% Read the image
x = imread("office_6.jpg");
figure("Name", "Original Office", "NumberTitle", "off");
imshow(x);

% Grayscale
y = rgb2gray(x);
figure("Name", "Grayscale Office", "NumberTitle", "off");
imshow(y);

% Edge detection 
e = edge(y, "canny");
figure("Name", "Edge Detection", "NumberTitle", "off");
imshow(e);

% Rotate the original image by 45 degrees 
I = imrotate(x, 45, "bilinear");
figure("Name", "Rotated Office (45°)", "NumberTitle", "off");
imshow(I);

% Crop a region 
x_crop = imcrop(x, [100, 50, 300, 100]);
figure("Name", "Cropped Office", "NumberTitle", "off");
imshow(x_crop);

% Display RGB values 
pixel_value = impixel(x, 300, 600);
disp("Pixel value at (300, 600):");
disp(pixel_value);

% Resize 
x_half = imresize(x, 0.5, "bicubic");
figure("Name", "Resized Office", "NumberTitle", "off");
imshow(x_half);

% Brighten using imadd
x_add = imadd(x, 50);
figure("Name", "Brightened Office", "NumberTitle", "off");
imshow(x_add);

% Darken using imsubtract
x_sub = imsubtract(x, 50);
figure("Name", "Darkened Office", "NumberTitle", "off");
imshow(x_sub);

% Intensify using immultiply
x_mul = immultiply(x, 1.5);
figure("Name", "Intensified Office", "NumberTitle", "off");
imshow(x_mul);

% Dim using imdivide
x_div = imdivide(x, 1.5);
figure("Name", "Dimmed Office", "NumberTitle", "off");
imshow(x_div);

% Negative 
x_com = 255 - x;
figure("Name", "Negative Office", "NumberTitle", "off");
imshow(x_com);

% Translate 
x_trans = imtranslate(x, [2.5 5.5]);
figure("Name", "Translated Office", "NumberTitle", "off");
imshow(x_trans);

% Display histogram of the translated image
x_trans_gray = rgb2gray(x_trans);
figure("Name", "Histogram of Translated Office", "NumberTitle", "off");
imhist(x_trans_gray);

% HDR Processing
hdr_img = hdrread("office.hdr");
rgb = tonemap(hdr_img);
figure("Name", "HDR vs Tonemapped Image", "NumberTitle", "off");
imshowpair(rgb, hdr_img, "montage");
title("Tonemapped RGB (Left) vs Raw HDR (Right)");