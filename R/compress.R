#' Return a compressed image
#' Quantizes an image into 2^b clusters and
#' return a version of the image (the same size as the original) 
#' where each pixel's original colour is replaced with the nearest 
#' prototype colour.
#'
#' @param img array, the image to be processed
#' @param b integer, the desired number of bits
#'
#' @return array, returns the compressed image
#' @export
#'
#' @examples
#' old_img <- array(1:24, dim = c(3, 4, 2))
#' (compressed_img <- compress(old_img, 3))
#' 
#' library(reticulate)


# compress function
compress <- function(img, b) {
  
  # check if input is valid
  if ((is.array(img) == FALSE) | (length(dim(img)) != 3)) {
    stop("TypeError: The dimension of the input image must be 3D array")
  }
  
  if (is.integer(b) == FALSE) {
    stop("TypeError: b should be an integer!")
  }
  
  if (b <= 0) {
    stop("ValueError: b should be positive")
  }
  
  # reshape the image
  image_array <- reticulate::array_reshape(img, dim = c(dim(img)[1]*dim(img)[2], dim(img)[3]))
  # use kmeans for compression
  model <- kmeans(image_array, 4)
  # reshape labels
  quantized_img <- reticulate::array_reshape(model$cluster, dim = c(dim(img)[1], dim(img)[2]))
  # find the cluster centers
  colours <- model$centers
  # dequantized where the original color is replaced 
  # with the nearest prototype colour
  image <- colours[quantized_img, ]
  image <- reticulate::array_reshape(image, dim = c(dim(img)[1], dim(img)[2], dim(img)[3]))
  
  return(image)
}


