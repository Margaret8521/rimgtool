
<!-- README.md is generated from README.Rmd. Please edit that file -->

# group12R

<!-- badges: start -->

<!-- badges: end -->

The goal of group12R is to perform image processing in R.

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("UBC-MDS/Rgroup12")
```
## Features
- `sharpen`:
  - This function enhances the edges in the image and returns a sharper-looking image.  At this moment, this function is restricted to gray-scale images only 
  
- `shrink`:
  - A function that performs vertical seam carve for image shrinking. This function take image input as array and return the shrinked image array.
  - There are a few existing Python packages that perform content-aware image resizing, such as `pyCAIR` (available on PyPI https://pypi.org/project/pyCAIR/), and `seam-carver` (https://pypi.org/project/seam-carver/). Currently, there is no package available on CRAN to resize images based on the same mechanism, however, there is a package available on Github to seam carve image (https://github.com/vgorte/SC-Package-R). These packages use the seam carving process to increase or decrease the size of the image by finding the seam with the lowest energy values from the energy map. Our implementation of image resizing is a less sophisticated version of seam carving, which focuses on downsizing images by removing low-energy vertical seams.

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(group12R)
## basic example code
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub\!
