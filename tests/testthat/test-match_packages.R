test_that("finds packages matching a pattern", {
  expect_true(any(grepl("tool", match_packages("tool"))))
})
