old_img <- array(rep(c(0.5), n = (100*100*3)), dim = c(100, 100, 3))
new_img <- sharpen(old_img)
invalid_img <- array(rep(c(1.1), n = (30*30*3)), dim = c(30, 30, 3))

test_that("sharpen works", {
  expect_identical(dim(new_img)[1], dim(old_img)[1])
  expect_identical(dim(new_img)[2], dim(old_img)[2])
})

test_that("output image type is array", {
  expect_true(is.array(sharpen(old_img)))
})

test_that("new image dimension is correct", {
  expect_equal(dim(new_img)[1:2], dim(new_img)[1:2])
})

test_that("yield error when input type is invalid", {
  expect_error(sharpen(invalid_img))
})
