Untitled
================

## GitHub Documents

This is an R Markdown format used for publishing markdown documents to
GitHub. When you click the **Knit** button all R code chunks are run and
a markdown file (.md) suitable for publishing to GitHub is generated.

## Including Code

You can include R code in the document as follows:

``` r
library(png)

convolve2d <- function(input, filter) {
  nrow <- dim(input)[1]
  ncol <- dim(input)[2]
  res <- array(1:(nrow*ncol), dim = c(nrow, ncol))
  
  filter_l <- dim(filter)[1]
  filter_half <- filter_l %/% 2
  filter_center <- filter_half + 1
  
  print(paste0("row=", nrow, "; col=", ncol))
  
  for(r in 1:nrow) {
    for(c in 1:ncol) {
      if(r - filter_half < 1) {
        ifil_start <-1 + filter_half - r + 1
        i_start <- 1
      } else {
        ifil_start <- 1
        i_start <- r - filter_half
      }
      
      if(r + filter_half > nrow) {
        ifil_end <- filter_l - (r + filter_half - nrow)
        i_end <- nrow
      } else {
        ifil_end <- filter_l
        i_end <- r + filter_half
      }
      
      if(c - filter_half < 1) {
        jfil_start <- 1 + filter_half - c + 1
        j_start <- 1
      } else {
        jfil_start <- 1
        j_start <- c - filter_half
      }
      
      if(c + filter_half > ncol) {
        jfil_end <- filter_l - (c + filter_half - ncol)
        j_end <- ncol
      } else {
        jfil_end <- filter_l
        j_end <- c + filter_half
      }
      filt <- filter[ifil_start:ifil_end, jfil_start:jfil_end]
      inp <- input[i_start:i_end, j_start:j_end]
      val <- sum(filt * inp)
      res[r, c] <- val
    }
  }
  
  (res - min(res)) / (max(res) - min(res))
}

sharpen <- function(img) {
  n <- 3
  N <- 2 * n + 1
  C <- n + 1
  filter <- array(rep(c(-1/(16 * n**2)), N * N), dim = c(N, N))
  filter[C, C] <- 1
  img2 <- img[, , 1]
  
  convolve2d(img2, filter)
}
```

``` r
img <- readPNG("../img/milad_cropped.png")
plot.new()
rasterImage(img[, , 1], 0, 0, 0.5, 1)
```

![](sharpen_files/figure-gfm/1.2-1.png)<!-- -->

``` r
img2 <- sharpen(img)
```

    ## [1] "row=372; col=372"

``` r
plot.new()
rasterImage(img2, 0, 0, 0.5, 1)
```

![](sharpen_files/figure-gfm/1.3%20test-1.png)<!-- -->
