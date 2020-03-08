
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Rgroup12

<!-- badges: start -->

<!-- badges: end -->

The goal of Rgroup12 is to perform image processing in R.

## Package Overview

`Rgroup12` is a R package that is intended to allow users to compress, sharpen and shrink an input image.
Our package only allows the input image to be a 3D numpy array and output the manipulated image as a 3D numpy array. It contains three functions: `compress()`, `sharpen()`, and `shrink()`.


## Feature Description

- `compress`:
  - This function quantizes an image by restricting each pixel to only take on one of the desired colour values
  and return a version of the image (the same size as the original) where each pixel's original colour is replaced with the nearest prototype colour.


- `sharpen`:
  - This function enhances the edges in the image and returns a sharper-looking image.  At this moment, this function is restricted to gray-scale images only

- `shrink`:
  - A function that removes border pixels for image shrinking until the desired width and height are reached.


## Usage scenario

- `sharpen` can be used to enhance the edges in a picture so that the details can stand out.

![](img/before_sharpen.png)  ![](img/after_sharpen.png)

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("UBC-MDS/Rgroup12")
```

## Related Packages

  There are a few existing R packages that perform image manipulation such as [magick](https://cran.r-project.org/web/packages/magick/vignettes/intro.html) and [imager](https://dahtah.github.io/imager/imager.html#resizing-rotation-etc.), which could be used for simplifying high-quantity images. However, these packages are usually very comprehensive and provide many functions to process the image in different ways. There are very few smaller packages available on Github to perform simpler image processing tasks like image shrinking such as [this package](https://github.com/vgorte/SC-Package-R) using seam carving mechanism. Our implementation of image processing is a less sophisticated version of the existing image processing tools, we  focus specifically on image compression, shrinking, and sharpening using simpler and easy to understand algorithms.


## Dependencies


- reticulate



## Usage

|Task    |  After import `Rgroup12`   |
|---------|---------------------|
|Compress an image to 3 bits per channel |  `Rgroup12.compress(image, 3)` |
|Sharpen an image by detecting and enhancing the edges|  `Rgroup12.sharpen(image)`|
|Shrink an image to desired width and height  |  `Rgroup12.shrink(image, 20, 20)`|
