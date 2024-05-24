test_that("outputs data.frame", {
  data <- data.frame(x = 1)
  out <- create_data_dictionary(data)
  expect_named(out, c("dataset", "column", "typeof", "definition"))
})
