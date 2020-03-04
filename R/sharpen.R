#' Return a sharpened image
#'
#' @param img array
#'
#' @return array
#' @export
#'
#' @examples
#' old_img <- array(1:24, dim = c(3, 4, 2))
#' (new_img <- sharpen(old_img))
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
