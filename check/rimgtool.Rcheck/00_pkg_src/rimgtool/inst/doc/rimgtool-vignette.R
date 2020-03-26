## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(rimgtool)

## ----1.1, eval=FALSE----------------------------------------------------------
#  img <- png::readPNG("../img/milad_cropped.png")
#  plot.new()
#  rasterImage(img[, , 1], 0, 0, 0.5, 1)

## ----1.3 test, eval=FALSE-----------------------------------------------------
#  img2 <- sharpen(img)
#  plot.new()
#  rasterImage(img2, 0, 0, 0.5, 1)

