% Read the image from URL
img = imread('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-oqLE1eGkK3Lz6TvOy5EYZWjf1zNDEQxJph-_AxPwSU-j7AMZJqUJhes&s=10');
figure;
% Original Color Image
subplot(2, 2, 1), imshow(img);
title('Original Color Image');
% Convert the color image to grayscale
gray_img = rgb2gray(img);
% Display the grayscale image
subplot(2, 2, 2), imshow(gray_img);
title('Grayscale Image');
% Convert grayscale back to a color image by duplicating the channels
color_from_gray = cat(3, gray_img, gray_img, gray_img);
% Duplicate grayscale into 3 channels
% Display the color image created from grayscale
subplot(2, 2, 3), imshow(color_from_gray);
title('Color Image from Grayscale');
% Apply a colormap to the grayscale image
colormap_img = ind2rgb(gray2ind(gray_img, 256), jet(256));
% Display the color-mapped grayscale image
subplot(2, 2, 4), imshow(colormap_img);
title('Color Mapped Grayscale Image');
