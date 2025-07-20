% Read and Display Original Image
tt = imread('onion.png');
figure(); imshow(tt);

% Display Individual Color Channels (R, G, B)
figure(); imshow(tt(:,:,1));  % Red Channel
figure(); imshow(tt(:,:,2));  % Green Channel
figure(); imshow(tt(:,:,3));  % Blue Channel

% Add Salt & Pepper Noise to the Image
tt1 = imnoise(tt, 'salt & pepper', 0.2);
figure(); imshow(tt1);

% Denoise the Noisy Image Using Median Filtering
tt2(:,:,1) = medfilt2(tt1(:,:,1), [3 3]);
tt2(:,:,2) = medfilt2(tt1(:,:,2), [3 3]);
tt2(:,:,3) = medfilt2(tt1(:,:,3), [3 3]);
figure(); imshow(tt2);

% Convert RGB Image to Grayscale
tt3 = rgb2gray(tt);
figure(); imshow(tt3);

% Display Histogram and Compute Statistics (Mean & Std Dev)
figure(); imhist(tt3);
m = mean2(tt3);
sd = std2(tt3);
m
sd

% Perform Edge Detection Using Sobel Operator
ttedge = edge(tt3, "sobel");
figure(); imshow(ttedge);
