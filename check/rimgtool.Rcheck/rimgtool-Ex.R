pkgname <- "rimgtool"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
library('rimgtool')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
base::assign(".old_wd", base::getwd(), pos = 'CheckExEnv')
cleanEx()
nameEx("compress")
### * compress

flush(stderr()); flush(stdout())

### Name: compress
### Title: Return a compressed image Quantizes an image into 2^b clusters
###   and return a version of the image (the same size as the original)
###   where each pixel's original colour is replaced with the nearest
###   prototype colour.
### Aliases: compress

### ** Examples

old_img <- array(1:24, dim = c(3, 4, 2))
(compressed_img <- compress(old_img, 3L))




cleanEx()
nameEx("crop")
### * crop

flush(stderr()); flush(stdout())

### Name: crop
### Title: Return a croped image of desired size by removing pixels from
###   borders of the image
### Aliases: crop

### ** Examples

old_img <- array(1:24, dim = c(10, 10, 3))
croped_img <- crop(old_img, 5, 5)



cleanEx()
nameEx("sharpen")
### * sharpen

flush(stderr()); flush(stdout())

### Name: sharpen
### Title: Author: Frank Lu Function name: sharpen
### Aliases: sharpen

### ** Examples

old_img <- array(rep(c(0.5), 100 * 100 * 3), dim = c(100, 100, 3))
new_img <- sharpen(old_img)



### * <FOOTER>
###
cleanEx()
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
