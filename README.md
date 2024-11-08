# Bio-images-filtration
Filtering Biomedical Images

Contrast Calculation:

First calculate the contrast between two defined regions in the image:
It extracts target and background samples from specific areas of the image matrix.
If the image is in color, it’s converted to grayscale using rgb2gray.
The mean intensity values of these regions are computed, and contrast is calculated as the absolute difference between the means.

After calculating contrast, the code outlines specific areas in the image using red and green rectangles to visually indicate the target and background samples. 

Probability Density Function (PDF) Calculation:
then I computes the image's PDF by normalizing the histogram values (imhist) of the grayscale image to find and visualize the distribution of pixel intensities across the image.

Histogram Equalization:
The cumulative distribution function (CDF) of the PDF is calculated (cumsum). This CDF is used to create a transformation function (T) for histogram equalization, which maps pixel values to enhance contrast.

The transformation function T is applied to the image, creating an enhanced version (enhanced_img) with improved contrast.
