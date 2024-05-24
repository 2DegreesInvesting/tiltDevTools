test_that("names datasets with correct structure", {
  product <- data.frame(companies_id = 1, a_product_col = "a")
  company <- data.frame(companies_id = 1, a_company_col = "a")
  profile <- tiltIndicator::tilt_profile(
    tiltIndicator::nest_levels(product, company)
  )

  expect_snapshot(as.data.frame(use_dictionary(profile)))
})
