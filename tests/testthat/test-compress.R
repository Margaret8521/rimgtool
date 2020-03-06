img <- array(1:24, dim = c(4, 4, 3))
img_wrong <- array(1:24, dim = c(4, 4))

test_that("test the output image of the compress function", {
  expect_equal(dim(compress(img, 2))[1], dim(img)[1])
  expect_equal(length(dim(compress(img, 2))), 3)
  expect_equal(dim(compress(img, 2))[2], dim(img)[2])
})

test_that("test the error handling when invalid inputs are entered", {
  expect_error(compress(img, 5.1))
  expect_error(compress(img_wrong, 2))
  expect_error(compress(img, -3))
})







