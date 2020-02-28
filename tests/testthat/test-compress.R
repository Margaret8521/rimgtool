test_that("compress works", {
  old_img <- array(1:24, dim = c(3, 4, 2))

  expect_identical(sharpen(old_img), old_img)
})
