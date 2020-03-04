#' Return a shrinked image of desired size by
#' removing pixels from borders of the image
#'
#' @param img input image as a array
#' @param width integer desired width for new image
#' @param height integer desired height for new image
#'
#' @return array for shrinked image
#' @export
#'
#' @examples
#' old_img <- array(1:24, dim = c(10, 10, 3))
#' shrinked_img <- shrink(old_img, 5, 5)

shrink <- function(image, width, height){

  # checking if input is valid
  if (is.array(image) == FALSE){
    stop("TypeError: input type for image should be array")
  }
  if (height > dim(image)[1] | width > dim(image)[2]){
    stop("ValueError: Desired height and width cannot exceeds original height and width")
  }
  if (width %% 1 != 0 | height %% 1 != 0 ){
    stop("TypeError: Height and width for new image must be integer")
  }
  if (height <= 0 | width <= 0){
    stop("ValueError: Desired height and width must be greater than 1")
  }
  # calculate number of rows/columns of pixels to be removed
  crop_row <- dim(image)[1] - height
  crop_col <- dim(image)[2] - width

  if (crop_row %% 2 == 0){
    top_row <- as.integer(crop_row/2)
    bottom_row <- as.integer(dim(image)[1] - top_row)
  }
  else {
    top_row <- as.integer((crop_row + 1)/2)
    bottom_row <- as.integer(dim(image)[1] - top_row + 1)
  }

  if (crop_col %% 2 == 0){
    left_col <- as.integer(crop_col/2)
    right_col <- as.integer(dim(image)[2] - left_col)
  }
  else {
    left_col <- as.integer((crop_col + 1)/2)
    right_col <- as.integer(dim(image)[2] - left_col + 1)
  }

  shrinked <- image[(top_row + 1):bottom_row, (left_col + 1):right_col, ]

  return(shrinked)

}
