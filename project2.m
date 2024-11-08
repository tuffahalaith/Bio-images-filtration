% Load the image
img = imread('RBC2.jpeg');

% Show the original image
figure(1);
imshow(img);
title(sprintf('Original Image/ Contrast: %.4f', contrast));

% Calculate the contrast of the image

target_sample = image(10:39, 10:49, :); 
background_sample = image(50:79, 50:89, :);
if size(image,3) == 3
    gray_image = rgb2gray(image);
else
    gray_image = image;
end
target_mean = mean2(gray_image(10:39, 10:49));
background_mean = mean2(gray_image(50:79, 50:89));
contrast = abs(target_mean - background_mean) / background_mean;
rectangle('Position', [10, 10, 40, 30], 'EdgeColor', 'r');
rectangle('Position', [50, 50, 40, 30], 'EdgeColor', 'g');
figure(1);
imshow(img);
title(sprintf('Original Image/ Contrast: %.4f', contrast));

% Calculate the probability density function (PDF) of the image
pdf = imhist(image) / numel(image);

% Plot the PDF
figure(3);
plot(pdf);
title('Probability Density Function (PDF)');

% Calculate the histogram equalization function
cdf = cumsum(pdf);
T = round(255 * cdf);

% Plot the histogram equalization function
figure(4);
plot(T);
title('Histogram Equalization Function');

% Apply histogram equalization on the image
enhanced_img = uint8(T(double(img)+1));

% Show the processed image
figure(6);
imshow(enhanced_img);
title(['Processed Image, Contrast = ', num2str(contrast_enhanced)]);

% Calculate the contrast of the enhanced image
%target_sample_enhanced = enhanced_img(90:119, 60:99);
%background_sample_enhanced = enhanced_img(190:219, 160:199);
%avg_target_enhanced = mean(target_sample_enhanced(:));
%avg_background_enhanced = mean(background_sample_enhanced(:));
%contrast_enhanced = abs(avg_target_enhanced - avg_background_enhanced) / avg_background_enhanced;
%title(['Processed Image, Contrast = ', num2str(contrast_enhanced)]);


background_sample = image(50:79, 50:89, :);
if size(image,3) == 3
    gray_image = rgb2gray(image);
else
    gray_image = image;
end
target_sample_enhanced = enhanced_img(90:119, 60:99);
background_sample_enhanced = enhanced_img(190:219, 160:199);
avg_target_enhanced = mean(target_sample_enhanced(:));
avg_background_enhanced = mean(background_sample_enhanced(:));
contrast_enhanced = abs(avg_target_enhanced - avg_background_enhanced) / avg_background_enhanced;
rectangle('Position', [10, 10, 40, 30], 'EdgeColor', 'r');
rectangle('Position', [50, 50, 40, 30], 'EdgeColor', 'g');
figure(6);
imshow(enhanced_img);
title(['Processed Image, Contrast = ', num2str(contrast_enhanced)]);

% Calculate the PDF of the processed image
pdf_enhanced = imhist(enhanced_img) / numel(enhanced_img);

% Plot the PDF of the processed image
figure(7);
plot(pdf_enhanced);
title('PDF of the Processed Image');