% Image URL
imagePath = 'https://cloudinary-marketing-res.cloudinary.com/image/upload/w_1300/q_auto/f_auto/hiking_dog_mountain';
% Read the image
img = imread(imagePath);
figure;
% Original image
subplot(1, 3, 1);
imshow(img);
title('Original');
% Intensified (brightness increased by factor 1.5)
subplot(1, 3, 2);
imshow(img* 1.5);
title('Intensified');
% Deintensified (brightness reduced by factor 0.5)
subplot(1, 3, 3);
imshow(img* 0.5);
title('Deintensified');
