image <- array(1:24, dim = c(50, 50, 3))
image_wrong_type <- list(1:5)

test_that("output image type is array", {
  expect_true(is.array(crop(image, 40, 40)))
})

test_that("new image dimension is correct", {
  expect_equal(dim(crop(image, 20, 20))[1:2], c(20, 20))
  expect_equal(dim(crop(image, 19, 19))[1:2], c(19, 19))
  expect_equal(dim(crop(image, 15.0, 15.0))[1:2], c(15, 15))
  expect_equal(dim(crop(image, 10, 10))[3], 3)
})

test_that("yield error when input type is invalid", {
  expect_error(crop(image, 20.1, 20.1))
  expect_error(crop(image_wrong_type, 10, 10))
})

test_that("yield error when input dimension of new image is invalid", {
  expect_error(crop(image, 100, 100))
  expect_error(crop(image, -1, -1))
})

