test_that("by default returns data", {
  data <- tibble::tibble(x = 1, y = 1)
  out <- relocate_cols(data)
  expect_equal(out, data)
})

test_that("works with `names` given as a character", {
  data <- tibble::tibble(x = 1, y = 1)
  out <- relocate_cols(data, "y")
  expect_named(out, c("y", "x"))
})

test_that("works with `names` given as an ineger", {
  data <- tibble::tibble(x = 1, y = 1)
  out <- relocate_cols(data, 2L)
  expect_named(out, c("y", "x"))
})

test_that("with `names` given as unknown type errors gracefully", {
  data <- tibble::tibble(x = 1, y = 1)
  expect_snapshot(error = TRUE, {
    relocate_cols(data, TRUE)
  })
})
