#' Return a compressed image
#'
#' @param img array, the image to be processed
#' @param n integer, the desired number of bits
#'
#' @return array, returns the compressed image
#' @export
#'
#' @examples
#' old_img <- array(1:24, dim = c(3, 4, 2))
#' (compressed_img <- compress(old_img))
compress <- function(img, n) {
  img
}
