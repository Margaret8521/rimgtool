
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rimgtool

<!-- badges: start -->

[![R build status](https://github.com/UBC-MDS/rimgtool/workflows/R-CMD-check/badge.svg)](https://github.com/UBC-MDS/rimgtool/actions)

[![codecov](https://codecov.io/gh/UBC-MDS/rimgtool/branch/master/graph/badge.svg)](https://codecov.io/gh/UBC-MDS/rimgtool)

[![](https://img.icons8.com/clouds/100/000000/external-link.png)](https://ubc-mds.github.io/rimgtool/)   [project vignette](https://ubc-mds.github.io/rimgtool/articles/rimgtool-vignette.html)
<!-- badges: end -->

The goal of `rimgtool` is to perform image processing in R.


## Team Members

|Name    |  Github   |
|---------|---------------------|
|Ruidan Ni |  [rita-ni](https://github.com/rita-ni)|
|Frank Lu|  [Frank Lu](https://github.com/franklu2014)|
|Kexin Zhao| [Margaret8521](https://github.com/Margaret8521)|


## Package Overview

`rimgtool` is a R package that is intended to allow users to compress, sharpen and crop an input image.
Our package only allows the input image to be a 3D numpy array and output the manipulated image as a 3D numpy array. It contains three functions: `compress()`, `sharpen()`, and `crop()`.


## Feature Description

- `compress`:
  - This function quantizes an image by restricting each pixel to only take on one of the desired colour values
  and return a version of the image (the same size as the original) where each pixel's original colour is replaced with the nearest prototype colour.


- `sharpen`:
  - This function enhances the edges in the image and returns a sharper-looking image.  At this moment, this function is restricted to gray-scale images only

- `crop`:
  - A function that removes border pixels for image croping until the desired width and height are reached.



## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("UBC-MDS/rimgtool")
```

## Related Packages

  There are a few existing R packages that perform image manipulation such as [magick](https://cran.r-project.org/web/packages/magick/vignettes/intro.html) and [imager](https://dahtah.github.io/imager/imager.html#resizing-rotation-etc.), which could be used for simplifying high-quantity images. However, these packages are usually very comprehensive and provide many functions to process the image in different ways. There are very few smaller packages available on Github to perform simpler image processing tasks like image croping such as [this package](https://github.com/vgorte/SC-Package-R) using seam carving mechanism. Our implementation of image processing is a less sophisticated version of the existing image processing tools, we  focus specifically on image compression, croping, and sharpening using simpler and easy to understand algorithms.


## Dependencies


- stats



## Usage

|Task    |  After import `rimgtool`   |
|---------|---------------------|
|Compress an image to 3 bits per channel |  `rimgtool.compress(image, 3)` |
|Sharpen an image by detecting and enhancing the edges|  `rimgtool.sharpen(image)`|
|crop an image to desired width and height  |  `rimgtool.crop(image, 20, 20)`|


## Usage scenario

- `sharpen` can be used to enhance the edges in a picture so that the details can stand out.  Displayed below, the photo on the left-hand side is before sharpening, and the photo on the right-hand side is after sharpening.  As the details are enhanced by our sharpening function, wrinkles and eyebrows are more obvious on the right-hand side photo.

![](img/before_sharpen.png)  ![](img/after_sharpen.png)